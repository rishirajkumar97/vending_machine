# frozen_string_literal: true

class AddBeveragesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :beverages, id: :string, limit: 36 do |t|
      t.string :beverage_name, limit: 36, null: false, index: true, unique: true
      t.timestamps
    end
  end
end
