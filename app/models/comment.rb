class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comments
  belongs_to :comment
end
