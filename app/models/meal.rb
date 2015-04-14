class Meal < ActiveRecord::Base
  belong_to :itinerary
  belongs_to :restaurant
end
