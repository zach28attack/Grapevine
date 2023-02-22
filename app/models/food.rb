class Food < ApplicationRecord

  validates :food_name, presence: true, length:{minimum:2, maximum:20}
  validates :calories, presence: true, length:{minimum:1, maximum:20}, numericality: { only_integer: true }
  validates :protein, presence: true, length:{minimum:1, maximum:20}, numericality: { only_integer: true }
  validates :fats, presence: true, length:{minimum:1, maximum:20}, numericality: { only_integer: true }
  validates :carbs, presence: true, length:{minimum:1, maximum:20}, numericality: { only_integer: true }
  validates :servings, presence: true, length:{minimum:1, maximum:20}, numericality: { only_integer: true }

end