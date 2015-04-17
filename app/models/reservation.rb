class Reservation < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :hotel

end
