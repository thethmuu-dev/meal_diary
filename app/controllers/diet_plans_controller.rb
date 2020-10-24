class DietPlansController < ApplicationController
  before_action :set_diet_plan, only: %i[edit update destroy]

  def index
    @paln = DietPlan.where(user_id: current_user.id).first
  end

  private

  def set_diet_plan
    @plan = DietPlan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:calories, :proteins, :carbohydrates, :fats)
  end
end
