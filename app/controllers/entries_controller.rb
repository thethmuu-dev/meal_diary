class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: %i[show edit update destroy]
  before_action :owner_check, only: %i[edit update destroy]

  def index
    @entries = Entry.where(user_id: current_user.id).where('created_at >= ?', Date.today)
  end

  def show
 
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user

    if params[:back]
      render :new
    elsif @entry.save
      redirect_to entries_path, notice: 'Entry saved.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @entry.destroy

    redirect_to entries_path, notice: 'Entry deleted.'
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:meal_type, :calories, :proteins, :carbohydrates, :fats, :category_id)
  end

  def owner_check
    return unless current_user != @entry.user

    flash[:alert] = 'You can only edit or delete your own entries'
    redirect_to @entry
  end
end
