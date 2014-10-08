class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @books = Book.scoped
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
    if @book.user != current_user
      redirect_to book_path(@book)
    end
  end

  def update
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

	def show
		@book = Book.find(params[:id])
	end

  def show_top_rated
  end

  def show_last_changed
  end

  def destroy
  end


	private

	def book_params
		params.require(:book).permit(:name, :user_id, :genre_id, :tag_id)
	end



end
