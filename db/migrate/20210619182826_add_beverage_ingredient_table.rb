# frozen_string_literal: true

# Add the Ingredient - Beverage Table which holds the beverage alone with its references ingredients and its units
class AddBeverageIngredientTable < ActiveRecord::Migration[6.0]
  def change
    create_table :beverage_ingredients, id: :string, limit: 36 do |t|
      t.references :beverage, foreign_key: true, limit: 36, null: false, index: true, type: :string
      t.references :ingredient, foreign_key: true, limit: 36, null: false, index: true, type: :string
      t.integer :units, default: 0, null: false

      t.timestamps
    end
  end
end
