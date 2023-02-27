class CreateFoodsMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :foods_meals do |t|
      t.references :food, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
