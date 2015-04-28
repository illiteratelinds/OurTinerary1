class Itinerary < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :meals
  has_many :activities
  has_many :hotels, through: :reservations
  has_many :attractions, through: :activities
  has_many :restaurants, through: :meals
  has_many :itinerary_items
  validates_presence_of :title, :user_id


  def res_pins
    reservations = self.reservations.collect do |reservation, json|
      [reservation.id, reservation.hotel.latitude, reservation.hotel.longitude]
    end.to_json
  end

  def meal_pins
    meal = self.meals.collect do |meal, json|
      [meal.id, meal.restaurant.latitude, meal.restaurant.longitude]
    end.to_json
  end

  def activity_pins
    activities = self.activities.collect do |activity, json|
      [activity.id, activity.attraction.latitude, activity.attraction.longitude]
    end.to_json
  end

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

  def itinerary_waypoints
    way_points = []
    ["reservations", "meals", "activities"].each do |itinerary_item| 
      itinerary_items = self.public_send(itinerary_item)
      itinerary_items.each do |item|
        way_points << find_parent(item).public_send("address") + " | "
      end
    end
    way_points
  end

  def find_parent(item)
    if item.class == Reservation 
      return item.public_send("hotel")
    elsif item.class == Meal
      return item.public_send("restaurant")
    elsif item.class == Activity
      return item.public_send("attraction")
    end
  end

end






