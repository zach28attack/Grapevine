class AddUserIdToFoodsMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :foods_meals, :user_id, :integer
  end
end
