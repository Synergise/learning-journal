# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
