class Account < ApplicationRecord
  belongs_to :user, required: false
end
