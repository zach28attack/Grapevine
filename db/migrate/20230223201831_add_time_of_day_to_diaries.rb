class AddTimeOfDayToDiaries < ActiveRecord::Migration[7.0]
  def change
    add_column :diaries, :time_of_day, :string
  end
end
