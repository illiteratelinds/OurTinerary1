class RestaurantsController < ApplicationController

  def new
    @itinerary = Itinerary.find(params["itinerary_id"])
    @restaurant = Restaurant.new
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    binding.pry
    itinerary = Itinerary.find(params[:itinerary_id])
    restaurant = Restaurant.new(restaurant_params)
    itinerary.restaurants << restaurant
    respond_to do |format|
      if itinerary.save
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
      params.require(:restaurant).permit(:name, :location, :date, :review)
    end
end


