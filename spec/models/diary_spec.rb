require 'rails_helper'

RSpec.describe Diary, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:diary) { FactoryBot.create(:diary, user: user) }

  context "when creating a valid Diary" do
    it "should be valid" do
      expect(diary).to be_valid
    end
  end

  context "when creating an invalid Diary" do

    it "should be invalid without :user" do
      diary.user_id = nil
      expect(diary).to_not be_valid
    end

    it "should be invalid without :calories_eaten" do
      diary.calories_eaten = nil
      expect(diary).to_not be_valid
    end
    it "should be invalid with value longer than 5 digits" do
      diary.calories_eaten = 10000
      expect(diary).to_not be_valid
    end

    it "should be invalid without :protein_eaten" do
      diary.protein_eaten = nil
      expect(diary).to_not be_valid
    end
    it "should be invalid with value longer than 5 digits" do
      diary.protein_eaten = 10000
      expect(diary).to_not be_valid
    end
    
    it "should be invalid without :fats_eaten" do
      diary.fats_eaten = nil
      expect(diary).to_not be_valid
    end
    it "should be invalid with value longer than 5 digits" do
      diary.fats_eaten = 10000
      expect(diary).to_not be_valid
    end

    it "should be invalid without :carbs_eaten" do
      diary.carbs_eaten = nil
      expect(diary).to_not be_valid
    end
    it "should be invalid with value longer than 5 digits" do
      diary.carbs_eaten = 10000
      expect(diary).to_not be_valid
    end
  end
end