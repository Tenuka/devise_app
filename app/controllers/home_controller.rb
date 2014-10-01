class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:admin]
  def index
  	#raise 123
  end

  def admin
    @users = User.scoped 
  end
end
