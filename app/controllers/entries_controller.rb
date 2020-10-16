class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  def index
    @entries = Entry.all
  end

  def show
 
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.save

    redirect_to entries_path, notice: 'Entry saved.'
  end

  def edit

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
end
