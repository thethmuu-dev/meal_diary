class DietPlansController < ApplicationController
  before_action :set_diet_plan, only: %i[edit update destroy show]

  def index
    @plan = current_user.diet_plan
  end

  def show
    @today_total = Entry.where(user_id: current_user.id)
                  .where('created_at >= ?', Date.today)
                  .select('SUM(calories) AS calories,SUM(proteins) AS Proteins ,SUM(carbohydrates) AS carbohydrates, SUM(fats) AS fats')
  end

  def new
    @plan = DietPlan.new
  end

  def create
    @plan = DietPlan.new(plan_params)
    @plan.user = current_user

    if @plan.save
      redirect_to diet_plans_path, notice: 'Your Diet Goal Set Successfully!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to diet_plans_path, notice: 'Your Diet Goal Updated Successfully!'
    else
      render 'edit'
    end
  end

  private

  def set_diet_plan
    @plan = DietPlan.find(params[:id])
  end

  def plan_params
    params.require(:diet_plan).permit(:calories, :proteins, :carbohydrates, :fats)
  end
end
