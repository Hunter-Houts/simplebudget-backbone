class Bill < ApplicationRecord
  belongs_to :user, required: false
end
