class AttractionsController < ApplicationController

  def new
    @itinerary = Itinerary.find(params["itinerary_id"])
    @attraction = Attraction.new
  end
  
  def show
    @attraction = Attraction.find(params[:id])
  end

  def index
    @attraction = Attraction.all
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    attraction = Attraction.find_by_id(params[:attraction][:id])
    if attraction
    else
      attraction = Attraction.new(attraction_params)
    end
    date = params["date"]
    date = Date.new(date["year"].to_i,date["month"].to_i,date["day"].to_i).to_s
    
    activity= Activity.new(:itinerary_id => params[:itinerary_id], :date => date)
    activity.itinerary_items.build(:itinerary_id => params[:itinerary_id])
    attraction.activities << activity
    respond_to do |format|
      if attraction.save
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
      params.require(:attraction).permit(:name, :address)
    end
end
