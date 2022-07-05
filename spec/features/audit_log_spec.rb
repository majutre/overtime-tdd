require 'rails_helper'

describe 'AuditLog Feature' do
  before do
    admin_user = create(:admin_user)
    login_as(admin_user, :scope => :user)
    create(:audit_log)
    visit audit_logs_path
  end

  describe 'index' do
    it 'has an index page that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      expect(page).to have_content(/Stark, Arya/)
    end

    it 'cannot be accessed by non-admin users' do
      logout(:user)
      user = create(:user)
      login_as(user, :scope => :user)

      visit audit_logs_path

      expect(current_path).to eq(root_path)
    end
  end
end