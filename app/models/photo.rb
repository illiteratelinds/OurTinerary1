class Photo < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true, dependent: :destroy
  has_many :comments, as: :commentable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
