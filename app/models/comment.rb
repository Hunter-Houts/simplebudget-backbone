class Comment < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :post, required: false
  has_many :comments, dependent: :delete_all
  belongs_to :comment, required: false
end
