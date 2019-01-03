class Account < ApplicationRecord
  validates_presence_of :income, :option
  belongs_to :user, required: false
end
