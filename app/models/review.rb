class Review < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  belongs_to :reviewable, polymorphic: true

end
