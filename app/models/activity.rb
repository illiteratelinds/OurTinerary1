class Activity < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :attraction
end
