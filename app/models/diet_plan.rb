class DietPlan < ApplicationRecord
  belongs_to :user
  validates :meal_type, :calories, :proteins, :carbohydrates, :fats, presence: true
end
