FactoryBot.define do
  factory :user do
    email { 'hal_jordan@gmail.com' }
    password { 'greenlanterncorps' }
    password_confirmation { 'greenlanterncorps' }
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    password_confirmation { Faker::Internet.password }
  end
end
