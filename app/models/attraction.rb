class Attraction < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :itineraries, through: :attractions
  has_many :users
  has_many :wishlists, as: :wishlistable
  has_many :reviews, through: :activities
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
