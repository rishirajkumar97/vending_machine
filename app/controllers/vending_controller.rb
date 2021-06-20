# frozen_string_literal: true

class VendingController < ApplicationController
  DISPENSED = 'Dispensed'

  # Index Method to Dispense a Beverage by calling /vend with required beverage id
  # Also Notifies the user if after any dispense action which of the ingredients reached 0 or has become empty
  # with its details
  def index
    ingredients = BeverageIngredient.where(beverage_id: params[:id])
    empty_ingredients = []
    hash = {}

    ingredient_needed = ingredients.map do |i|
      hash.store(i.ingredient_id.to_s, i.units)
      {
        id: i.ingredient_id.to_s,
        units: i.units
      }
    end

    ingredients_id = ingredient_needed.pluck(:id)

    ingredients_present = Ingredient.where(id: ingredients_id).as_json.map do |i|
      { name: i['name'], id: i['id'], units: i['units'] }
    end
    error_msg = []
    ingredients_present.each do |ing|
      id = ing[:id]
      current_units = ing[:units] - hash[id]
      if current_units >= 0
        hash[id] = current_units
      elsif current_units == 0
        empty_ingredient.push({ id: id, name: ing[:name] })
      else
        error_msg = error_msg.push("Unable to Dispense, Insufficient Ingredients: #{ing[:name]} is less than required units. Please Refill!")     
      end
    end

    raise ActionController::BadRequest, error_msg if error_msg.present?

    update_ingredients(hash)

    output_json = { status: DISPENSED }
    output_json[:empty_ingredients] = empty_ingredients if empty_ingredients.present?
    render json: output_json
  end

  private

  # Private method which completes the transaction once its ok to dispense the requireved beverage
  def update_ingredients(hash)
    hash.each do |key, value|
      ingredient = Ingredient.find_by!(id: key)
      ingredient.update(units: value)
    end
  end
end
