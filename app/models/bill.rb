class Bill < ApplicationRecord
  validates_presence_of :name, :amount
  belongs_to :user, required: false
end
