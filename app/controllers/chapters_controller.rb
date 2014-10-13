class ChaptersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @book = Book.find(params[:book_id])
    @chapters = @book.chapters.order(:number).page(params[:chapter]).per(1) 
  end

  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.create(chapter_params)
    @book = Book.find(params[:book_id])
    @chapter.book_id = @book.id
    if @chapter.save
      flash[:success] = "New Chapter was successfully created!"
      redirect_to book_chapter_path(@book, @chapter)
    else
      render 'new'
    end 
  end

  def update
    #binding.pry
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to book_chapters_path(@chapter.book_id), notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @chapter = Chapter.find(params[:id])
    @book = Book.find(@chapter.book_id)
  end

  private
  def chapter_params
    params.require(:chapter).permit(:name, :content, :number, :book_id)
  end

end
