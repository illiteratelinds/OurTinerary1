class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])
    @commentable = find_commentable
    @comments = @commentable.comments
  end

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

    def find_commentable
      params.each do |name, value|
        if name =~ /^id$/
          return Photo.find(value)
        end
      end
      nil
    end

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
