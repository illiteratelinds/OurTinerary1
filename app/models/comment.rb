class Comment < ActiveRecord::Base
  belongs_to :discussion, polymorphic: true
end
