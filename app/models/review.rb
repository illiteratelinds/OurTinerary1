class Review < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  belongs_to :reviewable, polymorphic: true
  validates_presence_of :content


end
