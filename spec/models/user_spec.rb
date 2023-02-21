require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.first_or_create(email: "example@test.com", password: "password")

  it 'has a password' do 
    expect(user).to be_valid
  end

  context 'without password' do
    it 'should be invalid' do
      user.password = nil
      expect(user).to be_valid
    end
  end

  context 'without email' do
    it 'should be invalid' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end

end
