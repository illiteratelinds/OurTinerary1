class ItineraryItem < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :itemable, polymorphic: true, dependent: :destroy

end
