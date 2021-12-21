class User < ApplicationRecord
  validates :username, presence: true

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
end
