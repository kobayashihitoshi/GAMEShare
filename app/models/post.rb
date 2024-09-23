class Post < ApplicationRecord
  validates :body, presence: true
  has_one_attached :image
  has_one_attached :video
  belongs_to :user
end
