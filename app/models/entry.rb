class Entry < ApplicationRecord
  validates :calories, :proteins, :carbohydrates, :fats, :meal_type, presence: true

  belongs_to :user
  belongs_to :category

  def day
    created_at.strftime('%b %e, %Y')
  end
end
