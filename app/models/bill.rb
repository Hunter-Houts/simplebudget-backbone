class Bill < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :account, required: false
end
