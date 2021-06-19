# frozen_string_literal: true

# Beverage Model
class Beverage < ApplicationRecord
  validates :beverage_name, presence: true, length: { maximum: 36 }
  validates_uniqueness_of :beverage_name, case_sensitive: false

  has_many :beverage_ingredients, dependent: :destroy

  accepts_nested_attributes_for :beverage_ingredients
end
