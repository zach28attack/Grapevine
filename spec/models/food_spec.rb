require 'rails_helper'

RSpec.describe Food, type: :model do
  food = Food.first_or_create(food_name: "eggs", calories: 70, protein: 23, fats: 10, carbs: 0, servings: 1)
  
  context "when creating a valid food" do
    it "should be valid" do
      expect(food).to be_valid
    end
  end

  context "when creating an invalid food" do

    it "should be invalid without a name" do
      food.food_name = ""
      expect(food).to_not be_valid
    end

    it "should be invalid without a calories" do
      food.food_name = "eggs"
      food.calories = ""
      expect(food).to_not be_valid
    end

    it "should be invalid without a protein" do
      food.protein = ""
      food.calories = "70"
      expect(food).to_not be_valid
    end

    it "should be invalid without a fats" do
      food.fats = ""
      food.protein = "23"
      expect(food).to_not be_valid
    end

    it "should be invalid without a carbs" do
      food.carbs = ""
      food.fats = "10"
      expect(food).to_not be_valid
    end

    it "should be invalid without a servings" do
      food.servings = ""
      food.carbs = "1"
      expect(food).to_not be_valid
    end

  end
  
end
