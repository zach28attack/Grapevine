require "rails_helper"

RSpec.describe FoodsController, :type => :controller do
  let!(:food)  {Food.create(food_name: "eggs", calories: 70, protein: 23, fats: 10, carbs: 0, servings: 1)}

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    it "has 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "returns successful" do
      get :show, params: {id: food.id}
      expect(response).to be_successful # same as expect(response.status).to eq(200)
    end
  end

  describe "GET edit" do
    it "returns successful" do
      get :edit, params: {id: food.id}
      expect(response).to be_successful 
    end
  end

  describe "GET show" do
    it "has 200 status code" do
      get :show, params: {id: food.id}
      expect(response).to be_successful # same as expect(response.status).to eq(200)
    end
  end

  describe "PATCH update" do
    context "with valid attributes" do
      it "updates food and redirects to show page" do
        patch :update, params: {id: food.id, food: {food_name: "Updated food name"}}
        food.reload
        expect(food.food_name).to eq("Updated food name")
        expect(response).to redirect_to(foods_path)
      end
    end

    context "with invalid attributes" do
      it "fails to update and renders edit" do
        patch :update, params: {id: food.id, food:{food_name:""}}
        food.reload
        expect(food.food_name).to eq("eggs")
        expect(response).to render_template(:edit)
      end
    end

  end

end