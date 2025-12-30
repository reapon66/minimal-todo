class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :user_name, presence: true, uniqueness: true
end
