class RemoveBudgetAndLeftFromDiaries < ActiveRecord::Migration[7.0]
  def change
    remove_column :diaries, :calories_budget
    remove_column :diaries, :calories_left
    
    remove_column :diaries, :protein_budget
    remove_column :diaries, :protein_left

    remove_column :diaries, :fats_budget
    remove_column :diaries, :fats_left

    remove_column :diaries, :carbs_budget
    remove_column :diaries, :carbs_left
  end
end
