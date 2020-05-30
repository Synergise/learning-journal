# frozen_string_literal: true

FactoryBot.define do
  factory :glossary, class: Glossary do
    term { Faker::Lorem.word }
    definition { Faker::Lorem.sentence }
  end
end
