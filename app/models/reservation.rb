class Reservation < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :hotel
  has_many :comments, as: :commentable
  has_many :photos, as: :imageable
  has_one :review, as: :reviewable
  has_many :itinerary_items, as: :itemable
end
