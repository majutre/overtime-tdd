require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
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
      expect(@user.full_name).to eq('Stark, Arya')
    end
  end

  describe 'relationship between admins and employees' do
    it 'allows for admins to be associated with multiple employees' do
      employee_1 = create(:user)
      employee_2 = create(:user)
      admin = create(:admin_user)
      Managee.create!(user_id: admin.id, managee_id: employee_1.id)
      Managee.create!(user_id: admin.id, managee_id: employee_2.id)

      expect(admin.managees.count).to eq(2)
    end
  end
end
