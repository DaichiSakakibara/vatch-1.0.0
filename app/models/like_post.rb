class LikePost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  valodates_uniqueness_of :post_id, scope: :user_id

end
