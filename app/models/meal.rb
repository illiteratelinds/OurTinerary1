class Meal < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :restaurant
  has_many :comments, as: :commentable
end
