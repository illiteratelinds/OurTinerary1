class RestaurantsController < ApplicationController

  def new
    @itinerary = Itinerary.find(params["itinerary_id"])
    @restaurant = Restaurant.new
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    restaurant = Restaurant.find_by_id(params[:restaurant][:id])
    unless restaurant
      restaurant = Restaurant.new(restaurant_params)
    end
    date = params["date"]
    date = Date.new(date["year"].to_i,date["month"].to_i,date["day"].to_i).to_s
    meal = Meal.new(:itinerary_id => params[:itinerary_id], :date => date)
    meal.itinerary_items.build(:itinerary_id => params[:itinerary_id])
    restaurant.meals << meal
    respond_to do |format|
      if restaurant.save
        format.html { redirect_to itinerary, notice: 'restaurant was successfully created.' }
        format.json { render :show, status: :created, location: restaurant }
      else
        format.html { render :new }
        format.json { render json: restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :latitude, :longitude)
    end
end


