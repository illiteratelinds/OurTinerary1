class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /^id$/
        return Activity.find(value)
      end
    end
    nil
  end

end
