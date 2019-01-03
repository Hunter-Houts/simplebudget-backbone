class Post < ApplicationRecord
  validates_presence_of :title, :body
  belongs_to :user, required: false
  has_many :comments, dependent: :delete_all
end
