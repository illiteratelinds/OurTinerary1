class HotelsController < ApplicationController
  
  def new
    @itinerary = Itinerary.find(params["itinerary_id"])
    @hotel = Hotel.new
  end
  
  def show
    @hotel = Hotel.find(params[:id])
  end

  def index
    @hotel = Hotel.all
  end

  def create
    binding.pry
    itinerary = Itinerary.find(params[:itinerary_id])
    hotel = Hotel.find_by_id(params[:hotel][:id])
    if hotel
    
    else
      hotel = Hotel.create(hotel_params)
    end
    hotel.reservations.build(:itinerary_id => params[:itinerary_id], :date => params[:date] )
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
      params.require(:hotel).permit(:name, :location, :date, :review)
    end
end
  