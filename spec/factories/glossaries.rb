# frozen_string_literal: true

FactoryBot.define do
  factory :glossary do
    term { Faker::Lorem.word }
    definition { Faker::Lorem.sentence }
  end
end
