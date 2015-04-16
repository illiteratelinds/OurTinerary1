class FlightsController < ApplicationController

  def new
    @itinerary = Itinerary.find(params["itinerary_id"])
    @flight = Flight.new
  end

  def show
    @flight = Flight.find(params[:id])
  end
  
  def index
    @flight = Flight.all
  end 

  def create
    flight = Flight.new(flight_params)
    itinerary = Itinerary.find(params[:itinerary_id])
    flight.itinerary_id = params["itinerary_id"] 
    respond_to do |format|
      if flight.save
        format.html { redirect_to itinerary, notice: 'flight was successfully created.' }
        format.json { render :show, status: :created, location: flight }
      else
        format.html { render :new }
        format.json { render json: flight.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_flight
      @flight = Flight.find(params[:id])
    end

    def flight_params
      params.require(:flight).permit(:airline, :origin, :destination, :date, :review, :itinerary_id)
    end
end
