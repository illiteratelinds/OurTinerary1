class Wishlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :wishlistable, polymorphic: true


  def find_join_table
    if self.wishlistable.class == Hotel
      return Reservation.new
    elsif self.wishlistable.class == Restaurant
      return Meal.new
    elsif self.wishlistable.class == Attraction
      return Activity.new
    end
  end



end
