class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  with_options presence: true do
    validates :nickname
    validates :birth_day 
  end

  with_options numericality: { other_than: 1 } do
    validates :veg_id
    validates :vatch_id
    validates :sex_id
    validates :blood_type_id
    validates :prefecture_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :veg
  belongs_to :vatch
  belongs_to :sex
  belongs_to :blood_type
  belongs_to :prefecture

end
