class User < ApplicationRecord
  validates :nome, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :senha, presence: true
end
