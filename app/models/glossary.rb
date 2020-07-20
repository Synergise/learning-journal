# frozen_string_literal: true

# class for glossary and entries
class Glossary < ApplicationRecord
  validates :term, :definition, presence: true
  attribute :term, :string
  attribute :definition, :string
  has_many :labellings
  has_many :labels, through: :labellings

  def label_list
    self.labels.map do |label|
      label.name
    end.join(', ')
  end

  def label_list=(labels_string)
    label_names = labels_string.split(",").collect{|l| l.strip.downcase}.uniq
    new_or_found_labels = label_names.collect { |name| Label.find_or_create_by(name: name) }
    self.labels = new_or_found_labels
  end
end
