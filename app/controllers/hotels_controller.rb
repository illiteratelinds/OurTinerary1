class HotelsController < ApplicationController
  
  def new
    @itinerary = Itinerary.find(params["itinerary_id"])
    @hotel = Hotel.new
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    hotel = Hotel.new(hotel_params)
    respond_to do |format|
      if hotel.save
        format.html { redirect_to itinerary, notice: 'hotel was successfully created.' }
        format.json { render :show, status: :created, location: hotel }
      else
        format.html { render :new }
        format.json { render json: hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :location, :date, :review, reservations_attributes: [:itinerary_id, :hotel_id])
    end
end
  