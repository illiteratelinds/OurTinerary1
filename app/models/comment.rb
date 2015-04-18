class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  def commenter_name
    self.commentable.itinerary.user.name
  end
end
