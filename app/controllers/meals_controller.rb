class MealsController < ApplicationController
  
  def show
    @meal = Meal.find(params[:id])
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
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to :back, notice: 'Restaurant was successfully added.'
    else
      redirect_to :back
    end
  end
private
  def meal_params
      params.require(:meal).permit(:restaurant_id, :itinerary_id, :start_date, :end_date)
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
  def find_wishlistable
    params.each do |name, value|
      if name =~ /^id$/
        return Meal.find(value).restaurant
      end
    end
    nil
  end

  def my_itinerary_item?
    @meal.itinerary.user == current_user
  end

  def wishlist_item_exists?
    current_user.wishlists.each do |wishlist|
      if wishlist.wishlistable == @wishlistable 
        return true
      end
    end
  end

end
