require 'rails_helper'

describe 'navigation to' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached succesfully' do
      expect(page.status_code).to eq(200)
    end
    
    it 'has a title of Posts' do
      expect(page).to have_content(/Time Tracker/)
    end

    it 'has a list of posts' do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/rationale1|rationale2/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created through new form' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale with rspec'
      click_on "Save"

      expect(page).to have_content('Some rationale with rspec')
    end

    it 'will have a user associated with' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end
end