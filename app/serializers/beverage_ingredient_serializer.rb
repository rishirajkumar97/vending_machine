# frozen_string_literal: true

# BeverageIngredient: Serializer for rendering JSON response.
class BeverageIngredientSerializer < ActiveModel::Serializer
  attributes :units, :ingredient_name

  def ingredient_name
    object.ingredient.name
  end
end
