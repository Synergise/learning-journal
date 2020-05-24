FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.safe_email }
    password { "password" }
    password_confirmation { "password" }
  end
end
