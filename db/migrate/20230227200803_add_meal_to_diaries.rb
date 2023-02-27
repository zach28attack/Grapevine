class AddMealToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_reference :diaries, :meal, optional: true, foreign_key: true
  end
end
