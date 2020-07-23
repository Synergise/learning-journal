# frozen_string_literal: true

# class for the labels of glossary entries
class Label < ApplicationRecord
  validates :name, presence: true
  has_many :labellings, dependent: :destroy
  has_many :glossaries, through: :labellings
end
