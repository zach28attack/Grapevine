class Meal < ApplicationRecord
has_many :foods_meals
has_many :foods, through: :foods_meals
has_many :diaries, dependent: :destroy
end