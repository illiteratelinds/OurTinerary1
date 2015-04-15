class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_many :attractions, through: :activities
  has_many :reservations
  has_many :hotels, through: :reservations
  has_many :dining_experience
  has_many :restaurants, through: :dining_experience
  has_many :flights
  validates_presence_of :title, :location, :user_id
end