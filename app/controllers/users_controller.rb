class UsersController < ApplicationController
	def index
		@users = User.scoped
	end

	def show
		@user = User.find(params[:id])
	end

end
