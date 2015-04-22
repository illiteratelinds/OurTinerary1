class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
    @commentable = find_commentable
    @comments = @commentable.comments
    @imageable = find_imageable
    @photos = @imageable.photos
    @reviewable = find_reviewable
    @review = @reviewable.review
    @wishlistable = find_wishlistable
    @wishlists = @wishlistable.wishlists
    @wishlist_exists = wishlist_item_exists?
    @my_item = my_itinerary_item?
  end
  
  private

    def find_commentable
      params.each do |name, value|
        if name =~ /^id$/
          return Reservation.find(value)
        end
      end
      nil
    end

    def find_imageable
      params.each do |name, value|
        if name =~ /^id$/
          return Reservation.find(value)
        end
      end
      nil
    end

    def find_reviewable
      params.each do |name, value|
        if name =~ /^id$/
          return Reservation.find(value)
        end
      end
      nil
    end

    def find_wishlistable
      params.each do |name, value|
        if name =~ /^id$/
          return Reservation.find(value).hotel
        end
      end
      nil
    end
  
    def my_itinerary_item?
      @reservation.itinerary.user == current_user
    end

    def wishlist_item_exists?
      current_user.wishlists.each do |wishlist|
      if wishlist.wishlistable == @wishlistable 
        return true
      end
    end
  end


end
