class WishlistsController < ApplicationController
  
  def index

  end

  def create
    @wishlistable = find_wishlistable
    @wishlist = @wishlistable.wishlists.build(wishlist_params)
    if @wishlist.save
      flash[:notice] = "Successfully created wishlist."
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Wishlist item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def find_wishlistable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end



    def wishlist_params
      params.require(:wishlist).permit(:user_id)
    end
  
end
