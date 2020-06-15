# frozen_string_literal: true

# class for glossary and entries
class Glossary < ApplicationRecord
  validates :term, presence: true
end
