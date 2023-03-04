class Diary < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :calories_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  validates :protein_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  validates :fats_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  validates :carbs_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  belongs_to :meal, optional: true

  def item_name
    if self.meal_id
     Meal.find(self.meal_id).meal_name 
    elsif self.food_id 
      Food.find(self.food_id).food_name 
    end
  end
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :by_time_of_day, -> (time_of_day) { where(time_of_day: time_of_day) }
end