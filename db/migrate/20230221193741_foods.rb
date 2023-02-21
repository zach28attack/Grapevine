class Foods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |f|
      f.string :food_name
      f.integer :calories
      f.integer :protein
      f.integer :carbs
      f.integer :fats
      f.integer :servings

      f.timestamps
    end
  end
end
