class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

  def index
    @books = User.find(params[:user_id]).books.scoped
  end

  def new
		@book = Book.new
	end

	def create
		@book = Book.create(book_params)
		@book.user = current_user
		if @book.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to edit_book_path(@book)
    else
      render 'new'
    end 
	end

  def edit
    @book = Book.find(params[:id])
  end

	def show
		@book = Book.find(params[:id])
	end

  def show_all
    @books = Book.scoped
  end


	private

	def book_params
		params.require(:book).permit(:name, :user_id)
	end



end
