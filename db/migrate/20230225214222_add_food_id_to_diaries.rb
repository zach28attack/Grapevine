class AddFoodIdToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :food_id, :integer
  end
end
