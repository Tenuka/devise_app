class UsersController < ApplicationController
	load_and_authorize_resource
  before_action :authenticate_user! #, only: [:index, :show]

  def index
    if current_user.admin?
      flash[:success] = "Welcome, Administrator!"      
		  @users = User.all
    else
      redirect_to root_url, :alert => "Access denied"
    end
	end

	def show
		@user = User.find(params[:id])
	end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def block
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
    
  end

end
