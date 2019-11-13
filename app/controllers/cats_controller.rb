class CatsController < ApplicationController
  before_action :find_cat, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new]

  def index
    @cats = Cat.all
  end
  
  def new
    @cat = Cat.new
    @tags = Tag.all
  end

  def create
    p cat_params[:tags_attributes]
    @cat = Cat.new(cat_params)
    @cat.owner_id = session[:user_id]
    if @cat.save
      redirect_to @cat
    else
      flash[:errors] = @cat.errors.full_messages
      redirect_to new_cat_path
    end
  end

  def search
    @cats = Cat.all.select{|c| c.attributes.values.any?{|v| v.to_s.downcase.include?(params[:q].downcase)}}
    render :index
  end


  def tagsearch
    @tag = Tag.find_by(name: params[:tag])
    @cats = Cat.select{|c| c.tags.include?(@tag)}
    render :index
  end

  def show
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    @tags = Tag.all
    if session[:user_id] == @cat.owner_id
      render :edit
    else
      flash[:errors] = []
      redirect_to @cat
    end
  end
  
  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to @cat
    else
      flash[:errors] = @cat.errors.full_messages
      redirect_to edit_cat_path(@cat)
    end
  end


  def destroy
    @cat.delete
    redirect_to my_profile_path
  end




  private

  # def valid_owner?
  #   @cat = Cat.find(params[:id])
  #   if !@cat.owner_id.to_i == 10000000
  #     redirect_to @cat
  #     flash[:error] = "You are not the owner of this cat"
  #   end
  # end

  
  def find_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :owner_id, :neighborhood, :breed, :price, tag_ids:[], tags_attributes: [:name])
  end

  def authorized_cat_owner?
    redirect_to my_profile_path unless session[:user_id] == Cat.find(params[:id]).owner_id
  end
    
end
