class Activity < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :attraction
  has_many :comments, as: :commentable
end
