class HomeController < ApplicationController
  def index
  	@books = Book.all.order(:name).limit(10)
    @last_changed_books = Book.all.order(updated_at: :desc).limit(10)
    @tags = Tag.all
    @count_books = []
    @tags.each do |tag|
      @count_books << tag.books.count
    end
    @max_count = @count_books.max
    @size = "20pt"
  end

end
