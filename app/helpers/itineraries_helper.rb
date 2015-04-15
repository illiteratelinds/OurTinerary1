module ItinerariesHelper

  def create_itinerary_conditional
    if logged_in? 
      link_to "Create New Itinerary", new_itinerary_path
    else 
      "Please log in to create your itinerary"
    end 
  end
end
