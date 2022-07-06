require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end

    it 'allows admin to approve posts from the homepage' do
      post = create(:post)
      admin_user = create(:admin_user)
      login_as(admin_user, :scope => :user)

      visit root_path

      click_on("approve_#{post.id}")
      
      expect(post.reload.status).to eq('approved')
    end
  end
end