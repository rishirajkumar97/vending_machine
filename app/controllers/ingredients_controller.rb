# frozen_string_literal: true

class IngredientsController < ApplicationController
  def index
    ingredient = Beverage.all
    render json: {
      items: ingredient.map { |i| ActiveModelSerializers::SerializableResource.new(i) },
      total_results: ingredient.count
    }
  end

  def create
    post_params = {
      name: params[:name],
      units: params[:units] || 0
    }
    render json: Ingredient.create!(post_params), status: :created
  end
end
