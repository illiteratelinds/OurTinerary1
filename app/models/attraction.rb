class Attraction < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :itineraries, through: :attractions
  has_many :users
  has_many :photos, as: :imageable
  has_many :wishlists, as: :wishlistable
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
