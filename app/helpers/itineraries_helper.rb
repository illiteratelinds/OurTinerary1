module ItinerariesHelper

  def create_itinerary_conditional
    if logged_in? 
      link_to "Create New Itinerary", new_itinerary_path, class:  "btn-social foursquare"
    else 
      link_to "Login with Facebook to create an itinerary", login_path, class:  "btn-social foursquare"
    end 
  end
end