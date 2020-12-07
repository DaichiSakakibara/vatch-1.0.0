class LikePostsController < ApplicationController

  def create
   @like_post = current_user.like_posts.create(post_id: params[:post_id])
   redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like_post = current_user.like_posts.find_by(post_id: @post.id)
    @like_post.destroy
    redirect_back(fallback_location: root_path)
  end
end
