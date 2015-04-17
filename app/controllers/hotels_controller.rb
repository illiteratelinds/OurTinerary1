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
    itinerary = Itinerary.find(params[:itinerary_id])
    hotel = Hotel.find_by_id(params[:hotel][:id])
    if hotel
    else
      hotel = Hotel.new(hotel_params)
    end
    startdate = params["start_date"]
    enddate = params["end_date"]
    start_date = Date.new(startdate["year"].to_i, startdate["month"].to_i, startdate["day"].to_i).to_s
    end_date = Date.new(enddate["year"].to_i, enddate["month"].to_i, enddate["day"].to_i).to_s
    hotel.reservations.build(:itinerary_id => params[:itinerary_id], :start_date => start_date, :end_date => end_date )
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
      params.require(:hotel).permit(:name, :address)
    end
end
  