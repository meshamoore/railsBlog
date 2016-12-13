class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'user_id'
  belongs_to :target, class_name: 'User', foreign_key: 'target_id'
end
