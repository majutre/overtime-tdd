require 'rails_helper'

describe 'navigate' do
  context 'index' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  context 'homepage actions' do
    it 'allows admin to approve posts' do
      post = create(:post)
      admin_user = create(:admin_user)
      login_as(admin_user, :scope => :user)

      visit root_path

      click_on("approve_#{post.id}")
      
      expect(post.reload.status).to eq('approved')
    end

    it 'allows employee to confirm audit logs' do
      audit_log = create(:audit_log)
      user = create(:user)
      login_as(user, :scope => :user)

      audit_log.update(user_id: user.id)
      
      visit root_path

      click_on("confirm_#{audit_log.id}")
      
      expect(audit_log.reload.status).to eq('confirmed')
    end
  end
end