class Meal < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :restaurant
  has_many :comments, as: :commentable
  has_many :photos, as: :imageable, dependent: :destroy
  has_one :review, as: :reviewable
  has_many :itinerary_items, as: :itemable, dependent: :destroy

  def itinerary_creator(user)
    itinerary.user == user
  end
end
