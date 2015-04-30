class Restaurant < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :itineraries, through: :meals
  has_many :users
  has_many :wishlists, as: :wishlistable
  has_many :reviews, through: :meals
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
