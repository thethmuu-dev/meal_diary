FactoryBot.define do
  factory :entry1, class: Entry do
    meal_type { 'Lunch' }
    calories { 200 }
    proteins { 100 }
    carbohydrates { 50 }
    fats { 5 }
    user_id { 1 }
    category_id { 1 }
  end
end
