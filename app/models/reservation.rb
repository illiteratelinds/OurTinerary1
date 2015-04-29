class Reservation < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :hotel
  has_many :comments, as: :commentable
  has_many :photos, as: :imageable, dependent: :destroy
  has_one :review, as: :reviewable
  has_many :itinerary_items, as: :itemable, dependent: :destroy

  def itinerary_creator(user)
    itinerary.user == user
  end

  def first_res_pin
      [hotel.latitude, hotel.longitude]
  end
  
end
