FactoryBot.define do
  factory :diet_plan do
    calories { 1000 }
    proteins { 500 }
    carbohydrates { 150 }
    fats { 15 }
    user_id { 1 }
  end
end
