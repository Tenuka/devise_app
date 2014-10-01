class BooksController < ApplicationController
	def index
    @books = current_user.books.scope
  end

  def new
		@book = Book.new
	end

	def create
		@book = Book.create(book_params)
		@book.user = current_user
		if @book.save
      flash[:success] = "Welcome to the Sample App!"
      render 'show'
    else
      redirect_to 'new'
    end 
	end

	def show
		@book = user.books.find(params[:id])
	end


	private

	def book_params
		params.require(:book).permit(:name)
	end

end
