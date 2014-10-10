class HomeController < ApplicationController
  def index
  	@books = Book.all.limit(10)
    #@last_changed_books =Book.all.order(name).limit(10)
  end

end
