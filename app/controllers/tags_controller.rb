class TagsController < ApplicationController
  before_action :find_tag , only: [:show , :edit, :update, :destroy]
  
  # show all data
  def index 
    @tag = Tag.all.order('created_at ASC')
  end
  
  # show form
  def new
    @tag = Tag.new
  end

  #process new
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to @tag 
      
    else
      render 'new'
    end
  end
  #show particular data
  def show
  end

  # show form for edit
  def edit
  end

  # process editing
  def update
    if @tag.update(tag_params) 
      redirect_to @tag
    else
      render 'new'
    end
  end
  
  def destroy
    if @tag.destroy 
      redirect_to tags_index_path
    else
      render 'new'
    end
  end
  
  private
  
  def tag_params
    params.require(:tag).permit(:name)
  end 
  
  def find_tag
    @tag=Tag.find(params[:id])
  end

end
