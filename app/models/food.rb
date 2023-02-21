class Food < ApplicationRecord

  validates :food_name, presence: true, length:{minimum:2, maximum:20}
  validates :calories, presence: true, length:{minimum:1, maximum:20}
  validates :protein, presence: true, length:{minimum:1, maximum:20}
  validates :fats, presence: true, length:{minimum:1, maximum:20}
  validates :carbs, presence: true, length:{minimum:1, maximum:20}
  validates :servings, presence: true, length:{minimum:1, maximum:20}

end