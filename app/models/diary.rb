class Diary < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :calories_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  validates :protein_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  validates :fats_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  validates :carbs_eaten, presence: true, numericality: { only_integer: true }, length: {minimum:1, maximum:4}
  belongs_to :meal, optional: true
end