# frozen_string_literal: true

FactoryBot.define do
  factory :label do
    name { Faker::ProgrammingLanguage.name }
  end
end
