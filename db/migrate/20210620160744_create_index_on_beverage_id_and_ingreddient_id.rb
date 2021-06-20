# frozen_string_literal: true

class CreateIndexOnBeverageIdAndIngreddientId < ActiveRecord::Migration[6.0]
  def change
    add_index :beverage_ingredients,
              %i[beverage_id ingredient_id],
              name: 'index_ingredient_beverage_unique',
              unique: true
  end
end
