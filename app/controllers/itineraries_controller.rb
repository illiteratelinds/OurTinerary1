class ItinerariesController < ApplicationController
  protect_from_forgery except: :update_position
  before_action :set_itinerary, only: [:show, :edit, :update, :destroy]

  def index
    @itineraries = Itinerary.all
    @users = User.all
  end  

  def show
    if @itinerary.reservations.count > 0
      @first_res = @itinerary.reservations.first.first_res_pin
    end
    @itinerary_types = {
      Meal => "Restaurant",
      Reservation => "Hotel",
      Activity => "Attraction"
    }
    @start_date = @itinerary.start_date.to_date
    @end_date = @itinerary.end_date.to_date
    @itinerary_dates = (@start_date..@end_date).map{|date|date.strftime("%B %d, %Y")}
  end

  def update_position
    data = params[:data].split(",").map{|num| num.to_i}
    ii_id = params[:itinerary_item_id]
    itinerary = ItineraryItem.find(ii_id).itinerary
    i = 0
    data.each do |num|
      iti = ItineraryItem.find(num)
      iti.position = i
      iti.save
      i += 1
    end
    render json: 'hi'
  end

  def new
    @itinerary = Itinerary.new
  end

  def edit
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.user = current_user
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { render :new }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to @itinerary, notice: 'Itinerary was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerary }
      else
        format.html { render :edit }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @itinerary.destroy
    respond_to do |format|
      format.html { redirect_to itineraries_url, notice: 'Itinerary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_itinerary
      @itinerary = Itinerary.find(params[:id])
    end

    def itinerary_params
      params.require(:itinerary).permit(:title, :start_date, :end_date, :user_id)
    end

end

