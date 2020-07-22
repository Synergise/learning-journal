# frozen_string_literal: true

# class for the labels of glossary entries
class Label < ApplicationRecord
  validates :name, presence: true
  # has_many :labellings, dependent: :restrict_with_exception
  # has_many :glossaries, through: :labellings
  has_and_belongs_to_many :glossaries
end
