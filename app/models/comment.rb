class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  def commenter
    self.commentable.itinerary.user
  end

  def commenter_name
    self.commentable.itinerary.user.name
  end

  def photo_commenter_name
    commentable.imageable.itinerary.user.name
  end
end
