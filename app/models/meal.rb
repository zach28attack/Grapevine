class Meal < ApplicationRecord
  validates :meal_name, presence: true, length:{minimum:2, maximum: 10}

  validates :meal_name, presence: true
  has_many :foods_meals
  has_many :foods, through: :foods_meals
  has_many :diaries
end