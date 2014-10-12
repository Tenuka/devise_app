class ChaptersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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
      flash[:success] = "Welcome to the Sample App!"
      redirect_to book_chapter_path(@book, @chapter)
    else
      render 'new'
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
