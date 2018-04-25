class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(user).permit(:name, :user_introduction, :profile_image)
  end
end
