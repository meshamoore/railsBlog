class User < ApplicationRecord
  has_many :posts

  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'target_id'
  has_many :active_relationships, class_name: 'Follow', foreign_key: 'user_id'

  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships,  source: :target
end
