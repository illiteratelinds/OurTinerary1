class Reservation < ActiveRecord::Base
  belongs_to :itinerary
  belongs_to :hotel
  has_many :comments, as: :commentable
  has_many :photos, as: :imageable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
