class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :posts

  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_id'
  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'

  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships,  source: :target

  def follow(target)
    Follow.create(user_id: id, target_id: target.id)
  end

  def feed
    following_ids = "SELECT target_id FROM follows WHERE  user_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
end
