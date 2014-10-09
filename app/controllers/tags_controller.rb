class TagsController < ApplicationController
  load_and_authorize_resource

  def create
    if @tag.save
      flash[:success] = "New Tag successfully added."
      redirect_to @tag
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to @tag }
    end
  end
end