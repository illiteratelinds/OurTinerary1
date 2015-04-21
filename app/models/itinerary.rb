class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_many :attractions, through: :activities
  has_many :reservations
  has_many :hotels, through: :reservations
  has_many :meals
  has_many :restaurants, through: :meals
  has_many :flights

  validates_presence_of :title, :user_id


  def itinerary_display_pic?
    if activities.first.nil? || activities.first.photos.first.nil?
      return false
    else
      return true
    end
  end

  def itinerary_item_photos
    photos = []
    ["reservations", "meals", "activities"].each do |itinerary_item| 
      itinerary_items = self.public_send(itinerary_item) 
      itinerary_items.each do |t| 
        t.public_send("photos").each do |photo| 
            photos << photo.image
        end 
      end 
    end 
    photos
  end

end

