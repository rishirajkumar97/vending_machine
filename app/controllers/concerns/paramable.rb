# frozen_string_literal: true

# Module to support for easier Params
module Paramable
  extend ActiveSupport::Concern

  def beverage_post_params
    {
      beverage_name: params[:name],
      beverage_ingredients_attributes: (params[:beverage_ingredients] || []).map do |bev_ingredient|
        { units: bev_ingredient[:units], ingredient_id: Ingredient.find_by(name: bev_ingredient[:name]).id }
      end
    }
  end
end
