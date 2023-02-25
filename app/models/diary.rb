class Diary < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :calories_eaten, presence: true
  validates :protein_eaten, presence: true
  validates :fats_eaten, presence: true
  validates :carbs_eaten, presence: true

end