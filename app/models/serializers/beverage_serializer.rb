# frozen_string_literal: true

class BeveragesSerializer < ActiveModel::Serializer
  attributes :id, :beverage_name, :created_at, :updated_at
end
