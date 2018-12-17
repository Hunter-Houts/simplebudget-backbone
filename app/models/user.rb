class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :bills
  has_one :account
  has_one :review
end
