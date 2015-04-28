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

  def date_range
    start_date = self.start_date.to_date
    end_date = self.end_date.to_date
    itinerary_dates = (start_date..end_date).map{|date|date.strftime("%B %d, %Y")}
  end

  def res_pins
    reservations = self.reservations.collect do |reservation, json|
      [reservation.id, reservation.hotel.name, reservation.hotel.address, reservation.hotel.latitude, reservation.hotel.longitude, "reservations"]
    end.to_json.html_safe
  end

  def meal_pins
    meal = self.meals.collect do |meal, json|
      [meal.id, meal.restaurant.name, meal.restaurant.address, meal.restaurant.latitude, meal.restaurant.longitude, "meals"]
    end.to_json.html_safe
  end

  def activity_pins
    activities = self.activities.collect do |activity, json|
      [activity.id, activity.attraction.name, activity.attraction.address, activity.attraction.latitude, activity.attraction.longitude, "activities"]
    end.to_json.html_safe
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






