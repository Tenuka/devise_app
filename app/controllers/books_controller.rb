class BooksController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]
	before_action :authenticate_user!, except: [:index, :show]

	def index
    @books = Book.order(:name).page(params[:page]).per(10) 
  end

  def create
    #binding.pry
    @book.user = current_user
		if @book.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @book
    else
      render 'new'
    end 
	end

  def edit
    @book = Book.find(params[:id])
    @chapters = @book.chapters
    @tags = @book.tags
  end

  def update
    #binding.pry

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

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@book.user_id), notice: 'Book was DELETED.' }
    end
  end

  def show_top_rated
  end

  def show_last_changed
  end

	private

  	def book_params
  		params.require(:book).permit(:name, :user_id, :genre_id, {tag_ids: []}, tags_attributes: [:id, :name, :_destroy], chapters_attributes: [:id, :name, :content, :number, :_destroy])
  	end



end
