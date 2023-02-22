class AddCalorieBudgetToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :calories_budget, :integer
  end
end
