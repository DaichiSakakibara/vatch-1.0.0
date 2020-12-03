class Post < ApplicationRecord

  def index
    @posts = Post.includes(:user).order("created_at DESC")
    end

    def new
      @post = Post.new
    end

    def create
      Post.create(tweet_create)
   end

   private
   def post_create
    params.require(:post).permit(:image,:text).merge(user_id: current_user.id)
   end
  
end

