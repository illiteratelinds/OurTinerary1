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
    results
  end

end
