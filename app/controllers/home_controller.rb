class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:admin]
  def index
  	@books = Book.scoped
  end

  def admin
    @users = User.scoped 
  end
end
