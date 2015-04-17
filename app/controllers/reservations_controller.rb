class ReservationsController < ApplicationController

  def show
    @reservation = Reservation.find(params[:id])
    @commentable = find_commentable
    @comments = @commentable.comments

  end

  def find_commentable
    params.each do |name, value|
      if name =~ /^id$/
        return Reservation.find(value)
      end
    end
    nil
  end
  
end
