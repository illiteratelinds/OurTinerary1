class Meal < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :restaurant
end
