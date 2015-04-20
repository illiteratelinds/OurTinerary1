class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def commenter
    self.user
  end

  def commenter_name
    self.user.name
  end

  def photo_commenter_name
    commentable.imageable.itinerary.user.name
  end

  
end
