class Hotel < ActiveRecord::Base
  has_many :itineraries
  has_many :users
  has_many :comments, as: :discussion
  has_many :photos, as: :imageable
end
