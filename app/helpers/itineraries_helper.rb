module ItinerariesHelper

  def create_itinerary_conditional
    if logged_in? 
      link_to "Create New Itinerary", new_itinerary_path, class:  "button button-3d button-primary button-rounded"
    else 
      link_to "Login with Facebook to create an itinerary", login_path, class:  "button button-3d button-primary button-rounded"
    end 
  end
end