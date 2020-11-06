class DietPlan < ApplicationRecord
  belongs_to :user
  validates :calories, :proteins, :carbohydrates, :fats, presence: true
end
