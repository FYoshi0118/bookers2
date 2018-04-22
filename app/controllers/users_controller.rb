class UsersController < ApplicationController
  def index
  end

  def show
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
end
