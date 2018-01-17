class BooksController < ApplicationController
  def top
  end

  def index
  	# 空のモデルをビューへ渡す
    @book = Book.new
    # booksテーブルから全てのデータを取得し、変数@booksに代入しています
    @books = Book.all
  end

  def create
    # ストロングパラメーターを使用
    book = Book.new(book_params)
    # DBへ保存する
    book.save
    # 詳細画面へリダイレクト
    redirect_to '/books'
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
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
        params.require(:book).permit(:title, :body)
      end
end
