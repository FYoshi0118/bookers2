class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
  end

  def show
    @new_book = Book.new
    @user = @book.user
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    # TODO: destroyのリダイレクト先はBooksの一覧にする
    redirect_to user_path(current_user.id)
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
