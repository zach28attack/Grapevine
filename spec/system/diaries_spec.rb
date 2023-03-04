require 'rails_helper'

RSpec.describe "Diaries", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let(:food) { FactoryBot.create(:food) }
  let(:meal) { FactoryBot.create(:meal) }
  let(:foods_meal) { FactoryBot.create(:foods_meal, user: user, food_id: food.id, meal_id: meal.id) }
  let!(:diary) { FactoryBot.create(:diary, user: user, time_of_day: "Breakfast") }
  let!(:diary2) { FactoryBot.create(:diary, user: user, time_of_day: "Lunch") }
  let!(:diary3) { FactoryBot.create(:diary, user: user, time_of_day: "Dinner") }

  before do
    driven_by(:rack_test)
    sign_in user
  end

  describe "GET #index" do
    it "should have 200 status code" do 
      visit diaries_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "GET #new" do 
    it "Should have a 200 status code" do
      visit new_diary_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "should create new diary" do
        expect{
          visit new_diary_path
          fill_in "diary[calories_eaten]", with: 500
          fill_in "diary[protein_eaten]", with: 25
          fill_in "diary[fats_eaten]", with: 20
          fill_in "diary[carbs_eaten]", with: 15
          click_button "Create Diary"
        }.to change(Diary, :count).by(1)
        expect(page).to have_current_path(diaries_path)
        
      end
    end
################################################################
    context "with invalid attributes" do
      it "should not create new diary" do
        expect{
          visit new_diary_path
          fill_in "diary[calories_eaten]", with: nil
          fill_in "diary[protein_eaten]", with: 25
          fill_in "diary[fats_eaten]", with: 20
          fill_in "diary[carbs_eaten]", with: 15
          click_button "Create Diary"
        }.to_not change(Diary, :count)
        expect(page.status_code).to eq(422)
      end
    end

#########################################################
    context "using pre-populated foods" do
      it "should save diary" do
        expect{
          visit new_diary_path
          click_button "Add food"
        }.to change(Diary, :count).by(1)
        expect(page).to have_current_path(diaries_path)
      end
    end

    context "with pre-populated foods_meals" do
      it "should save diary" do
        expect {
          foods_meal
          visit new_diary_path
          click_button "Add meal"
        }.to change(Diary, :count).by(1)
      end
    end

  end
end
