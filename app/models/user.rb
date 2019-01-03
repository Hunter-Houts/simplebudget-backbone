class User < ApplicationRecord
  validates_presence_of :username, :email
  validates :username, uniqueness: true
  has_secure_password
  has_many :posts
  has_many :bills
  has_one :account
  has_one :review
end
