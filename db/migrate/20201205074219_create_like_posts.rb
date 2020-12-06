class CreateLikePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :like_posts do |t|
      t.integer :user_id,             null: false
      t.integer :post_id,             null: false
      t.timestamps
    end
  end
end
