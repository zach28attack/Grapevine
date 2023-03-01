class FoodsMeal < ApplicationRecord
  belongs_to :food,  dependent: :destroy
  belongs_to :meal,  dependent: :destroy
  belongs_to :user
end
