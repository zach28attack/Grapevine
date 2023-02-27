class FoodsMeal < ApplicationRecord
  belongs_to :food
  belongs_to :meal
  belongs_to :user
end
