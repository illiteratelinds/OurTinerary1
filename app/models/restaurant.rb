class Restaurant < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :itineraries, through: :meals
  has_many :users
  has_many :comments, as: :commentable
  has_many :photos, as: :imageable
  has_many :wishlists, as: :wishlistable

end
