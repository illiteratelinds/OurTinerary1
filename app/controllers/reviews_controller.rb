class ReviewsController < ApplicationController
  
  def new
    @reviewable = find_reviewable
  end  

  def create
    @reviewable = find_reviewable
    @review = Review.new(review_params)
    @reviewable.review = @review
    if @review.save
      flash[:notice] = "Successfully created review."
      redirect_to @reviewable
    else
      flash[:notice] = "Please input text to submit a review."
      redirect_to :back
    end
  end

  private

    def find_reviewable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    def review_params
      params.require(:review).permit(:content, :creator_id, :rating)
    end

end
