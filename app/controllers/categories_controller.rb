class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]
  before_action :owner_check, only: %i[edit update destroy]

  def index
    @categories = Category.where(user_id: current_user.id).where('created_at >= ?', Date.today)
  end

  def show 
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id

    if params[:back]
      render :new
    elsif @category.save
      redirect_to categories_path, notice: 'Category saved.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path, notice: 'Category deleted.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

  def owner_check
    return unless current_user.id != @category.user_id

    flash[:alert] = 'You can only edit or delete your own categories'
    redirect_to @category
  end
end
