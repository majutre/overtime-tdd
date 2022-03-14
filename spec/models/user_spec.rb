require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: 'teste@teste', 
                        password: '12345678', 
                        password_confirmation: '12345678',
                        first_name: 'Jon',
                        last_name: 'Snow',
                      )
  end
  
  describe 'user creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name and last_name' do
      @user.first_name = nil
      @user.last_name = nil
      
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a method full_name that combines first and last name' do
      expect(@user.full_name).to eq('Snow, Jon')
    end
  end
end
