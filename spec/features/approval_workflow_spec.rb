require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = create(:admin_user)
    login_as(@admin_user, :scope => :user) 
  end

  context 'edit' do
    before do
      @post = FactoryBot.create(:post)
      visit edit_post_path(@post)
    end

    it 'has a status that can be edited by an admin_user' do
      select('approved', :from => 'post_status')
      click_button 'Save'

      expect(@post.reload.status).to eq('approved')
    end

    it 'cannot be edited by a non admin_user' do
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      visit edit_post_path(@post)

      expect(page).to_not have_content(/Status/)
    end

    it 'should not be editable by the post creator if status is approved' do
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      @post.update(user_id: user.id, status: 'approved')

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end
  end
end