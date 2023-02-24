require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.first_or_create(name: "Johnny Test", email: "example@test.com", password: "password", cals_budget: 2000)

  context 'when creating a valid user' do 
    it 'should be valid' do 
      expect(user).to be_valid
    end
  end

  context 'when creating an invalid user' do

    it 'is invalid without password' do
      user.password = ''
      expect(user).to_not be_valid
    end

    it 'is invalid with password less than 6 characters' do
      user.password = '12345'
      expect(user).to_not be_valid
    end

    it 'is invalid without email' do
      user.password = "password"
      user.email = ''
      expect(user).to_not be_valid
    end

  end
end
