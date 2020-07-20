class Label < ApplicationRecord
  validates :name, presence: true
  has_many :labellings
  has_many :glossaries, through: :labellings
end
