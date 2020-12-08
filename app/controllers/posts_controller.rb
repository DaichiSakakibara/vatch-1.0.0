class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_create)
 end

 def show
  @post = Post.find(params[:id])
  @comment = Comment.new
  @comments = @post.comments.includes(:user)
end

 private
 def post_create
  params.require(:post).permit(:text,:image).merge(user_id: current_user.id)
 end

end
