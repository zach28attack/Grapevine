class CreateMealsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :meal_name
    end
  end
end
