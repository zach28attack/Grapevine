class RemoveCaloriesBudgetFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :calories_budget
  end
end
