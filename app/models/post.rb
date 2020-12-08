class Post < ApplicationRecord
  validates :text , presence: true
  belongs_to :user
  # has_one_attached :image
  mount_uploader :image, AvatarUploader
  has_many :comments, dependent: :destroy
  has_many :like_posts, dependent: :destroy

  # validates :content, presence: true, unless: :was_attached?

  # def was_attached?
  #   self.image.attached?
  # end

end
