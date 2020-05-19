FactoryBot.define do
  factory :user do
    email { 'hal_jordan@gmail.com' }
    username { 'hal_jordan' }
    password { 'greenlanterncorps' }
    password2 { 'greenlanterncorps' }
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    password2 { Faker::Internet.password }
  end
end
