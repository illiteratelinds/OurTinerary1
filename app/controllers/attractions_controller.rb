class AttractionsController < ApplicationController

  def new
    @itinerary = Itinerary.find(params["itinerary_id"])
    @attraction = Attraction.new
  end
  
  def show
    @attraction = Attraction.find(params[:id])
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    attraction = Attraction.new(attraction_params)
    itinerary.attractions << attraction
    respond_to do |format|
      if itinerary.save
        format.html { redirect_to itinerary, notice: 'attraction was successfully created.' }
        format.json { render :show, status: :created, location: attraction }
      else
        format.html { render :new }
        format.json { render json: attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :location, :date, :review)
    end
end
