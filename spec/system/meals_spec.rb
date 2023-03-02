require 'rails_helper'

RSpec.describe "Meals", type: :system do
  before do
    driven_by(:rack_test)
    sign_in user
  end
  let!(:user) { FactoryBot.create(:user) }
  let(:meal) { FactoryBot.create(:meal) }
  
  context "with valid name" do
    it "should redirect to FoodsMeal#new" do
      expect {
        visit new_diary_path
        click_button "Create Meal"
        expect(page).to have_current_path(new_foods_meal_path)
      }
    end
  end

end
