class Hotel < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :itineraries, through: :reservations
  has_many :users
  has_many :comments, as: :discussion
  has_many :photos, as: :imageable
  accepts_nested_attributes_for :reservations

end
