class Flight < ActiveRecord::Base
  belongs_to :itinerary
  has_many :comments, as: :discussion
  has_many :photos, as: :imageable
end
