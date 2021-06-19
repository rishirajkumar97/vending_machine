# frozen_string_literal: true

# Ingredient Model
class Ingredient < ApplicationRecord
  validates :name, presence: true, length: { maximum: 36 }
  validates_uniqueness_of :name, case_sensitive: false
  validates :units,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              message: 'does not have a valid value. Value should be a number more'\
              ' than or equal to zero and not a decimal.'
            }
end
