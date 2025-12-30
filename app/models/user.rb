class User < ApplicationRecord
  has_many :tarefas, dependent: :destroy


  validates :nome, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :senha, presence: true
end
