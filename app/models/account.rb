class Account < ApplicationRecord
  has_many :bills
  belongs_to :user, required: false
end
