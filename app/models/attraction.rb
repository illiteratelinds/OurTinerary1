class Attraction < ActiveRecord::Base
  has_many :activities, dependent: :destroy
  has_many :itineraries, through: :attractions
  has_many :users
  has_many :comments, as: :discussion
  has_many :photos, as: :imageable
  accepts_nested_attributes_for :activities
end
