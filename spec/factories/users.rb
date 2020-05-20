FactoryBot.define do
  factory :user do
    email { 'hal_jordan@gmail.com' }
    # username { 'hal_jordan' }
    password { 'greenlanterncorps' }
    password_confirmation { 'greenlanterncorps' }
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    # username { Faker::Internet.username }
    password { Faker::Internet.password }
    password_confirmation { Faker::Internet.password }
  end
end
