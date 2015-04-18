class MealsController < ApplicationController
  
  def show
    @meal = Meal.find(params[:id])
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /^id$/
        return Meal.find(value)
      end
    end
    nil
  end
end
