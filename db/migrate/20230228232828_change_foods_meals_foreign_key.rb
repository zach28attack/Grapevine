class ChangeFoodsMealsForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :foods_meals, :foods
    add_foreign_key :foods_meals, :foods, on_delete: :cascade
    remove_foreign_key :foods_meals, :meals
    add_foreign_key :foods_meals, :meals, on_delete: :cascade
  end
end
