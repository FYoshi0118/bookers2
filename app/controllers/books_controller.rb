class BooksController < ApplicationController
  before_action :ensure_correct_book, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      # render :new
      redirect_to books_path
    end
  end

  def index
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    # if @book.update(book_params)
    #   redirect_to book_path(@book.id)
    # else
    #   redirect_to book_path(@book.id)
    # end
    # 保存出来ても出来なくてもbook#showに飛ぶ
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end

  def ensure_correct_book
    @book = Book.find(params[:id])
    # binding.pry
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end
end
