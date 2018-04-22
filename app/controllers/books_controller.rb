class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to 'http://localhost:3000/users/1' # TODO: リダイレクト先はbookの詳細ページ
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
