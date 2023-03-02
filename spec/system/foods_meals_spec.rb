require 'rails_helper'

RSpec.describe "FoodsMeals", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let(:food) { FactoryBot.create(:food) }
  let(:meal) { FactoryBot.create(:meal) }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  describe "POST #create" do
    it "creates new foods_meal" do
      expect {
        meal
        visit new_foods_meal_path(id: meal.id)
        click_button "Add food"
      }.to change(FoodsMeal, :count).by(1)
    end
  end
end
