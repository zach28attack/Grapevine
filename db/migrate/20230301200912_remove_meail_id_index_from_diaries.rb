class RemoveMeailIdIndexFromDiaries < ActiveRecord::Migration[7.0]
  def change
    remove_index :diaries, column: :meal_id
  end
end
