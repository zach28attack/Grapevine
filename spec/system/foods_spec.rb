require 'rails_helper'

RSpec.describe "Foods", type: :system do
  
  let!(:user) { FactoryBot.create(:user) }
  before do
    driven_by(:rack_test)
    sign_in user
  end
  

  describe "GET #new" do
    it "should have 200 status code" do

      visit new_food_path
      expect(page.status_code).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "should create new food" do
        expect {
          visit new_food_path
          fill_in "food[food_name]", with: "salmon"
          fill_in "food[calories]", with: 500
          fill_in "food[protein]", with: 50
          fill_in "food[fats]", with: 20
          fill_in "food[carbs]", with: 0
          fill_in "food[servings]", with: 1
          click_button "Create Food"
        }.to change(Food, :count).by(1)
        expect(page).to have_current_path(new_diary_path)
      end
    end

    context "with invalid attributes" do
      it "shouldn't create new food" do
        expect {
          visit new_food_path
          fill_in "food[food_name]", with: "steak"
          fill_in "food[calories]", with: nil
          fill_in "food[protein]", with: 25
          fill_in "food[fats]", with: 15
          fill_in "food[carbs]", with: 5
          fill_in "food[servings]", with: 1 
          click_button "Create Food"
        }.to change(Food, :count).by(0)
        expect(page.status_code).to eq(422) #HTTP response code for unprocessable entity
      end
    end
  end

  # describe "GET #edit" do
  #   it "returns successful" do
  #     sign_in user
  #     get :edit, params: {id: food.id}
  #     expect(response).to be_successful 
  #   end
  # end

  # describe "PATCH #update" do
  #   context "with valid attributes" do
  #     it "updates food and redirects to show page" do
  #       sign_in user
  #       patch :update, params: {id: food.id, food: {food_name: "Updated food name"}}
  #       food.reload
  #       expect(food.food_name).to eq("Updated food name")
  #       expect(response).to redirect_to(foods_path)
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "fails to update and renders edit" do
  #       sign_in user
  #       patch :update, params: {id: food.id, food:{food_name:""}}
  #       food.reload
  #       expect(food.food_name).to eq("eggs")
  #       expect(response).to render_template(:edit)
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "deletes food and redirects to index" do
  #     sign_in user
  #     expect { delete :destroy, params: {id: food.id}}.to change(Food, :count).by(-1)
  #     expect(response).to redirect_to(foods_path)
  #   end
  # end
  
end
