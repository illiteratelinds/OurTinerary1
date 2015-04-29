class Hotel < ActiveRecord::Base
  has_many :users
  has_many :reservations, dependent: :destroy
  has_many :itineraries, through: :reservations
  # polymorphic associations
  has_many :wishlists, as: :wishlistable
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
