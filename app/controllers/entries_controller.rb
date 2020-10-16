class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = Entry.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end
end
