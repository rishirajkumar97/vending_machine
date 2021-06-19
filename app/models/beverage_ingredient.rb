# frozen_string_literal: true

# Beverage Ingredient Model
class BeverageIngredient < ApplicationRecord
  belongs_to :beverage

  belongs_to :ingredient

  validates :units,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 0,
              message: 'does not have a valid value. Value should be a number more'\
              ' than or equal to zero and not a decimal.'
            },
            uniqueness: { scope: :beverage_id }
end
