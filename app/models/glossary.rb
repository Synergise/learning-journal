# frozen_string_literal: true

# class for glossary and entries
class Glossary < ApplicationRecord
  validates :term, :definition, presence: true
  # attribute :term, :string, presence: false
  # attribute :definition, :string
end
