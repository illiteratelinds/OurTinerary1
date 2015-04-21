class MealsController < ApplicationController
  
  def show
    @meal = Meal.find(params[:id])
    @commentable = find_commentable
    @comments = @commentable.comments
    @imageable = find_imageable
    @photos = @imageable.photos
    @reviewable = find_reviewable
    @review = @reviewable.review
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /^id$/
        return Meal.find(value)
      end
    end
    nil
  end

  def find_imageable
    params.each do |name, value|
      if name =~ /^id$/
        return Meal.find(value)
      end
    end
    nil
  end


  def find_reviewable
      params.each do |name, value|
        if name =~ /^id$/
          return Meal.find(value)
        end
      end
      nil
    end
end
