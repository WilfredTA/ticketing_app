class TagsController < ApplicationController
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "Tag has been created"
      redirect_to tags_path
    else
      render 'new'
    end
  end


  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      flash[:notice] = "Tag has been updated"
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def destroy

  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def index
    @tags = Tag.all
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
