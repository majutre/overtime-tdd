require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  
  describe 'user creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
    it 'cannot be created without a first_name' do
      @user.first_name = nil
      
      expect(@user).to_not be_valid
    end

    it 'cannot be created without a last_name' do
      @user.last_name = nil
      
      expect(@user).to_not be_valid
    end

    it 'cannot be created without a phone number' do
      @user.phone = nil

      expect(@user).to_not be_valid
    end

    it 'requires phone attribute to only contain digits' do
      @user.phone = 'thegreatstr'

      expect(@user).to_not be_valid
    end

    it 'requires phone attribute to contain only 11 chars' do
      @user.phone = '1234567890'

      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a method full_name that combines first and last name' do
      expect(@user.full_name).to eq('Stark, Arya')
    end
  end
end
