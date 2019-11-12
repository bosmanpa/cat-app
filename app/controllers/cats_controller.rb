class CatsController < ApplicationController
  before_action :find_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
  end
  
  def new
    @cat = Cat.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end






  private
  
  def find_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :owner_id, :neighborhood, :price)
  end
end
