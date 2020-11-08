# users seeder
User.create!(email: 'admin@gmail.com',
             username: 'admin',
             password: 'adminadmin',
             is_admin: true)

5.times do
  username = Faker::Name.unique.first_name.downcase
  email = "#{username}@gmail.com"
  User.create!(email: email,
               username: username,
               password: 'password')
end

# categories seeder
categories = ['Build Muscle', 'Body Fit', 'Weight Gain', 'Weight Loss']
categories.each do |item|
  Category.create!(title: item,
                   user_id: 1)
end

# entries seeder
meal_types = ['Breakfast', 'Lunch', 'Dinner']
20.times do
  Entry.create!(meal_type: meal_types.sample,
                category_id: Faker::Number.between(from: 1, to: 4),
                user_id: 1,
                calories: Faker::Number.between(from: 250, to: 350),
                proteins: Faker::Number.between(from: 80, to: 120),
                carbohydrates: Faker::Number.between(from: 20, to: 50),
                fats: Faker::Number.between(from: 5, to: 15))
end
