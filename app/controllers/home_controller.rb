class HomeController < ApplicationController
  def index
  	#raise 123
  end

  def admin
    @users = User.scoped 
  end
end
