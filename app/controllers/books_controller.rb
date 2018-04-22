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
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    # TODO: destroyのリダイレクト先はBooksの一覧にする
    redirect_to user_path(current_user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
