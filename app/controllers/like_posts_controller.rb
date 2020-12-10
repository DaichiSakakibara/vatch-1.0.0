class LikePostsController < ApplicationController
   before_action :post_params

  def create
   @like_post = current_user.like_posts.create(post_id: params[:post_id])
  end

  def destroy
    @like_post = current_user.like_posts.find_by(post_id: @post.id)
    @like_post.destroy
  end

   def post_params
     @post = Post.find(params[:post_id])
   end

end
