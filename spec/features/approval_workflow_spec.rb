require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, :scope => :user) 
  end

  context 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'has a status that can be edited' do
      visit edit_post_path(@post)
      
      select('approved', :from => 'post_status')
      click_button 'Save'

      expect(@post.reload.status).to eq('approved')
    end
  end
end