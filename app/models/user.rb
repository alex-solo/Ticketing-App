class User < ApplicationRecord
  has_secure_password
  
  has_many :tickets 

  validates :name, presence: true
  validates :email, uniqueness: true
end