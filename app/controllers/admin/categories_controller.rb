class Admin::CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    if
      @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.new
      render 'index'
    end
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
  end

  def update
  end
  
  private 
  
  def category_params
    params.require(:category).permit(:name)
  end

end
