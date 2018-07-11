class CatsController < ApplicationController
  def index
    @cats = Cat.all
    # render json: @cats
  end
  
  def show
    @cat = Cat.find(params[:id])
    
    unless @cat
      redirect_to cats_url
    end
  end
  
  def new 
    @cat = Cat.new
  end 
  
  def create 
    @cat = Cat.new(cat_params)
      if @cat.save 
        redirect_to cat_url(@cat)
      else 
        render :new 
      end 
  end 
  
  def edit  
    @cat = Cat.find(params[:id])
  end 
  
  def update 
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else 
      render :edit 
    end 
  end 
  private
  
  def cat_params

    params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
  end
  
end