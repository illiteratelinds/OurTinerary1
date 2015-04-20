class Reservation < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :hotel
  has_many :comments, as: :commentable
  has_many :photos, as: :imageable
  has_many :reviews, as: :reviewable
  
end
