require "rails_helper"

RSpec.describe FoodsController, :type => :controller do
  let!(:food) {Food.create(food_name: "eggs", calories: 70, protein: 23, fats: 10, carbs: 0, servings: 1)}
  let!(:user) {User.create(email: "testing@example.com", password: "123456", cals_budget:2000)}
  describe "GET #index" do
    it "has a 200 status code" do
      sign_in user
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #new" do
    it "has 200 status code" do
      sign_in user
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates new food" do
        sign_in user
        expect {
          post :create, params: { food: { food_name: "salmon", calories: 500, protein: 50, fats: 20, carbs: 0, servings: 1 }}
      }.to change(Food, :count).by(1)
      end

      it "redirects to root" do
        sign_in user
        post :create, params: { food: { food_name: "salmon", calories: 500, protein: 50, fats: 20, carbs: 0, servings: 1 }}
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid attributes" do
      it "creates new food" do
        sign_in user
        expect {
          post :create, params: { food: { food_name: "", calories: nil, protein: nil, fats: nil, carbs: nil, servings: nil }}
      }.to_not change(Food, :count)
      end

      it "redirects to root" do
        sign_in user
        post :create, params: { food: { food_name: "", calories: nil, protein: nil, fats: nil, carbs: nil, servings: nil }}
        expect(response).to render_template(:new)
      end
    end

  end

  describe "GET #show" do
    it "returns successful" do
      sign_in user
      get :show, params: {id: food.id}
      expect(response).to be_successful # same as expect(response.status).to eq(200)
    end
  end

  describe "GET #edit" do
    it "returns successful" do
      sign_in user
      get :edit, params: {id: food.id}
      expect(response).to be_successful 
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates food and redirects to show page" do
        sign_in user
        patch :update, params: {id: food.id, food: {food_name: "Updated food name"}}
        food.reload
        expect(food.food_name).to eq("Updated food name")
        expect(response).to redirect_to(foods_path)
      end
    end

    context "with invalid attributes" do
      it "fails to update and renders edit" do
        sign_in user
        patch :update, params: {id: food.id, food:{food_name:""}}
        food.reload
        expect(food.food_name).to eq("eggs")
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes food and redirects to index" do
      sign_in user
      expect { delete :destroy, params: {id: food.id}}.to change(Food, :count).by(-1)
      expect(response).to redirect_to(foods_path)
    end
  end

end