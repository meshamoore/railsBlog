class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :posts

  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'
  has_many :following, through: :active_relationships,  source: :target

  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_id'
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(user)
    active_relationships.create(target_id: user.id)
  end

  def unfollow(user)
     active_relationships.find_by(target_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def get_follow(user)
    Follow.where(user_id: self.id, target_id: user.id).first
  end

  def feed
    following_ids = "SELECT target_id FROM follows WHERE user_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
end
