# frozen_string_literal: true

# Ingredient Controller to update or get or delete Ingredient
class IngredientsController < ApplicationController
  # Index Method to retrieve all the ingredients
  def index
    ingredient = Ingredient.all
    render json: {
      items: ingredient.map { |i| ActiveModelSerializers::SerializableResource.new(i) },
      total_results: ingredient.count
    }
  end

  # Show method to retrieve a single ingredient by Id
  def show
    params.require(%i[id])
    render json: Ingredient.find_by(id: params[:id])
  end

  # Create Method to post a new Ingredient using the necessary params
  def create
    post_params = {
      name: params[:name].downcase,
      units: params[:units] || 0
    }
    render json: Ingredient.create!(post_params), status: :created
  end

  # Update Method to Refill the Ingredients by the Users
  def update
    retrieve_and_validate_put.update!(units: params[:units])
    head :no_content
  end

  private

  # Private: Validates few constraints in update action.
  def retrieve_and_validate_put
    params.require(%i[id units])
    ingredient_config = Ingredient.find_by(id: params[:id])
    message = 'The requested ingredient cannot be' \
              'updated for this since its the same value'
    (raise ActionController::BadRequest, message) unless ingredient_config.units != params[:units].to_i
    ingredient_config
  end
end
