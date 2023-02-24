class AddBudgetToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cals_budget, :integer
    add_column :users, :protein_budget, :integer
    add_column :users, :fats_budget, :integer
    add_column :users, :carbs_budget, :integer
  end
end
