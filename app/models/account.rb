class Account < ApplicationRecord
  has_many :bills
  has_one :user
end
