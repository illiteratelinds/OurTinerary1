class Search < ActiveRecord::Base

  def self.for(keyword)
    results = []
    Hotel.where("name LIKE ?", "%#{keyword}%").each do |hotel|
      results << hotel
    end
    Restaurant.where("name LIKE ?", "%#{keyword}%").each do |restaurant|
      results << restaurant
    end
    Attraction.where("name LIKE ?", "%#{keyword}%").each do |attraction|
      results << attraction
    end
    Itinerary.where("title LIKE ?", "%#{keyword}%").each do |itinerary|
      results << itinerary 
    end
    User.where("name LIKE ?", "%#{keyword}%").each do |user|
      results << user
    end
    results
  end

end
