class BooksController < ApplicationController

  before_action :set_book, :only => [ :show, :edit, :update, :destroy]

  def index
    @books = Book.page(params[:page]).per(3)
  end

  def new
    @book = Book.new
  end

  def show
    @page_title = @book.name
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_url(@book)
    else
      render :action => :edit
    end
    flash[:notice] = "更新成功！"
  end

  def destroy
    @book.destroy

    redirect_to books_url
    flash[:alert] = "刪除成功！"
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_url
    else
      render :action => :new
    end
    flash[:notice] = "增加一本書了！"
  end

  private

  def book_params
    params.require(:book).permit(:name, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
