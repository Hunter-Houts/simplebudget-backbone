class Bill < ApplicationRecord
  has_one :user
  belongs_to :account
end
