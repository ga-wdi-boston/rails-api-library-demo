class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def index
    @books = Book.all

    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = Book.create(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    head :no_content
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  private :book_params, :set_book
end
