class User < ApplicationRecord
  validates :username, presence: true

  has_one :profile
  has_many :posts
end
