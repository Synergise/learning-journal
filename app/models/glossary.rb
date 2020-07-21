# frozen_string_literal: true

# class for glossary and entries
class Glossary < ApplicationRecord
  validates :term, :definition, presence: true
  attribute :term, :string
  attribute :definition, :string
  has_many :labellings, dependent: :restrict_with_exception
  has_many :labels, through: :labellings

  def label_list
    labels.map { |label| label.name }.join(', ')
  end

  def label_list=(labels_string)
    label_names = labels_string.split(',')
                                .map { |label| label.strip.downcase }.uniq
    new_or_found_labels = label_names
                          .map { |name| Label.find_or_create_by(name: name) }
    labels = new_or_found_labels
  end
end
