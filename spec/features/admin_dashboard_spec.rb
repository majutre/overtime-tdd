require 'rails_helper'

describe 'admin dashboard' do
  it 'can be reached successfully' do
    visit admin_root_path
    expect(page.status_code).to eq(200)
  end

  it 'does not allow users to access without being signed in' do
    visit admin_root_path
    expect(current_path).to eq(new_user_session_path)
  end

  context 'non-admin user tries to reach' do
    before do
      user = create(:user)
      login_as(user, :scope => :user)
  
      visit admin_root_path
    end
    it 'cannot be reached' do
      expect(current_path).to eq(root_path)
    end

    it 'shows alert when user get redirected' do
      expect(page).to have_content(/You are not authorized to access this page./)
    end
  end
  
  context 'admin user tries to reach' do
    before do
      admin_user = create(:admin_user)
      login_as(admin_user, :scope => :user)
  
      visit admin_root_path
      expect(current_path).to eq(admin_root_path)
    end
  end
  
end