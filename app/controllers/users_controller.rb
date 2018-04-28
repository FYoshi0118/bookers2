class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @new_book = Book.new
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    # binding.pry
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # if @user.update(user_params)
    #   redirect_to user_path(@user.id)
    # else
    #   render :edit
    # end
    # 保存出来ても出来なくてもマイページに飛ぶ
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :user_introduction, :profile_image)
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user.id)
    end
  end
end
