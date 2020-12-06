class Post < ApplicationRecord
  validates :text , presence: true
  belongs_to :user
  has_many :comments
  has_many :like_posts, dependent: :destroy

end
