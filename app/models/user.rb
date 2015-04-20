class User < ActiveRecord::Base
  has_many :itineraries
  has_many :activities, through: :itineraries
  has_many :hotels, through: :itineraries
  has_many :flights, through: :itineraries
  has_many :restaurants, through: :itineraries
  has_many :friendships
  has_many :comments
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :active_friends, -> { where(friendships: { status: true}) }, :through => :friendships, :source => :friend
  has_many :passive_friends, -> { where(friendships: { status: true}) }, :through => :passive_friendships, :source => :user
  has_many :pending_friends, -> { where(friendships: { status: false}) }, :through => :friendships, :source => :friend
  has_many :requested_friendships, -> { where(friendships: { status: false}) }, :through => :passive_friendships, :source => :user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpg"
  has_many :reviews, foreign_key: :creator_id


  def friends
    active_friends | passive_friends
  end

  def already_friends(user)
    friends.include? user 
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"]
    end
  end

end