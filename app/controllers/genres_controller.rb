class GenresController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def create
    if @genre.save
      flash[:success] = "Genre was successfully created."
      redirect_to users_path
    else
      render 'new'
    end
  end


  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to users_path, notice: 'Genre was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Genre was DELETED.' }
    end
  end

  private

    def genre_params
      params.require(:genre).permit(:name)
    end
end
