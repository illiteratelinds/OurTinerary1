class Restaurant < ActiveRecord::Base
  has_many :meals, dependent: :destroy
  has_many :itineraries, through: :meals
  has_many :users
  has_many :comments, as: :discussion
  has_many :photos, as: :imageable
  accepts_nested_attributes_for :meals
end
