# frozen_string_literal: true

# Add Ingredient Table
class AddIngredientTable < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients, id: :string, limit: 36 do |t|
      t.string :name, limit: 36, null: false, index: true
      t.integer :units, default: 0, null: false
      t.timestamps
    end
  end
end
