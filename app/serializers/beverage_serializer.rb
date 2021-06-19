# frozen_string_literal: true

class BeverageSerializer < ActiveModel::Serializer
  attributes :id,
             :beverage_name,
             :beverage_ingredients,
             :created_at,
             :updated_at

  has_many :beverage_ingredients
end
