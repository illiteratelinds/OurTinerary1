class PhotosController < ApplicationController
  def create
    @imageable = find_imageable
    @photo = @imageable.photos.build(photo_params)
    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to :back
    else
      render :action => 'new'
    end
  end

  private

    def find_imageable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    def photo_params
      params.require(:photo).permit(:image)
    end
end
