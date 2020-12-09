class UsersController < ApplicationController
  # before_action :user_search, only: [:index, :search]

  def index 
    @users = User.all 
    @q = User.ransack(params[:q])  # 検索オブジェクトを生成
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(user_params)
      flash[:success] = "プロフィールが更新されました！"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  # def search
  #   users = @q.result(distinct: true)
  #   render /users
  #   # render json: { users: users }
  # end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :email, :veg_id, :vatch_id, :sex_id, :blood_type_id, :prefecture_id, :birth_day, :avater)
  end 

  def user_search
    @q = User.ransack(params[:q])  # 検索オブジェクトを生成
  end

end
