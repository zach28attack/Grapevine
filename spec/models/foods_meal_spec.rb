require 'rails_helper'

RSpec.describe FoodsMeal, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:meal) { FactoryBot.create(:meal) }
  let!(:food) { FactoryBot.create(:food) }
  let!(:foods_meal) { FactoryBot.create(:foods_meal, user: user) }
  
  context "with nil :meal_id" do
    it "should be invalid" do
      foods_meal.meal_id = nil
      expect(foods_meal).to_not be_valid
    end
  end

  context "with nil :food_id" do
    it "should be invalid" do
      foods_meal.food_id = nil
      expect(foods_meal).to_not be_valid
    end
  end
end
