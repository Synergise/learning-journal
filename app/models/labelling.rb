# frozen_string_literal: true

# The model to link labels to glossary entries
class Labelling < ApplicationRecord
  belongs_to :label
  belongs_to :glossary
end
