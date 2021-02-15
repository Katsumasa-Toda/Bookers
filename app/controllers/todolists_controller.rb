class TodolistsController < ApplicationController
  def new
    @book = Book.new
  end
  def index
    @books = Book.all
    @book = Book.new(book_params)
  end
  def show
    @book = Book.find(params[:id])
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to todolist_path(@book)
    else
      render :new
    end
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to todolist_path(@book)
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to todolist_path
  end

  private

  def book_params
    params.require(:book).permit(:本のタイトル, :感想)
  end
end