class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 4..12 }

  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
end
