class Attraction < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :itineraries, through: :attractions
  has_many :users
  has_many :comments, as: :commentable
  has_many :photos, as: :imageable
end
