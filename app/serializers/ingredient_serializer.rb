# frozen_string_literal: true

class IngredientSerializer < ActiveModel::Serializer
  attributes :id, :name, :units, :updated_at
end
