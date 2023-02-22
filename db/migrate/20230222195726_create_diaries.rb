class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.integer :calories_budget
      t.integer :calories_eaten
      t.integer :calories_left

      t.integer :protein_budget
      t.integer :protein_eaten
      t.integer :protein_left

      t.integer :fats_budget
      t.integer :fats_eaten
      t.integer :fats_left

      t.integer :carbs_budget
      t.integer :carbs_eaten
      t.integer :carbs_left

      t.integer :user_id
      t.timestamps
    end
  end
end
