require 'rails_helper'

RSpec.describe "Diaries", type: :system do
  before do
    driven_by(:rack_test)
  end
  let!(:user) { FactoryBot.create(:user) }
  let!(:breakfast_diary) { FactoryBot.create(:diary, time_of_day: "breakfast", user: user) }
  let!(:lunch_diary) { FactoryBot.create(:diary, time_of_day: "lunch", user: user) }
  let!(:dinner_diary) { FactoryBot.create(:diary, time_of_day: "dinner", user: user) }


  describe "GET #index" do
    it "should have 200 status code" do 
      sign_in user
      
      visit diaries_path
      expect(page.status_code).to eq(200)
    end
  end
  
end
