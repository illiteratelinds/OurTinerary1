class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @commentable = find_commentable
    @comments = @commentable.comments
    @imageable = find_imageable
    @photos = @imageable.photos
    @reviewable = find_reviewable
    @review = @reviewable.review
    @wishlistable = find_wishlistable
    @wishlists = @wishlistable.wishlists
    @wishlist_exists = wishlist_item_exists?
    @my_item = my_itinerary_item?
  end
  
  def create
    @activity = Activity.new(activity_params)
    @wishlist = Wishlist.find(params[:wishlist_id]) #destroy wishlist item from wishlist page
    @activity.itinerary_items.build(:itinerary_id => params[:activity][:itinerary_id])
    if @activity.save
      @wishlist.destroy
      redirect_to :back, notice: 'Attraction was successfully added.'
    else
      redirect_to :back
    end
  end
private
  def activity_params
      params.require(:activity).permit(:attraction_id, :itinerary_id, :date)
    end

  def find_commentable
    params.each do |name, value|
      if name =~ /^id$/
        return Activity.find(value)
      end
    end
    nil
  end

  def find_imageable
    params.each do |name, value|
      if name =~ /^id$/
        return Activity.find(value)
      end
    end
    nil
  end

  def find_reviewable
    params.each do |name, value|
      if name =~ /^id$/
        return Activity.find(value)
      end
    end
    nil
  end
  def find_wishlistable
    params.each do |name, value|
      if name =~ /^id$/
        return Activity.find(value).attraction
      end
    end
    nil
  end

  def my_itinerary_item?
      @activity.itinerary.user == current_user
    end

  def wishlist_item_exists?
    current_user.wishlists.each do |wishlist|
      if wishlist.wishlistable == @wishlistable 
        return true
      end
    end
  end

end
