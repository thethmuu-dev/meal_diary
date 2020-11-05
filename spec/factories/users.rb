FactoryBot.define do
  factory :user, class: User do
    username { 'thet' }
    email { 'thet@gmail.com' }
    password { 'thetthet' }
  end

  factory :user2, class: User do
    username { 'yee' }
    email { 'yee@gmail.com' }
    password { 'yeeyeeyee' }
  end
end