require 'rails_helper'

describe 'navigation to' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, :scope => :user)
  end

  describe '#index' do
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

  describe '#new' do
    it 'has a link from the navbar' do
      visit root_path
      
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe '#create' do
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

  describe '#edit' do
    before do
      @edit_user = User.create(first_name: "Edit", last_name: "Test", email: "edit@test.com", password: "12345678", password_confirmation: "12345678")
      login_as(@edit_user, :scope => :user)
      @edit_post = Post.create(date: Date.today, rationale: "Edit test", user_id: @edit_user.id)
    end
    
    it 'can be reached by clicking link on index page' do
      visit posts_path
      
      click_link("edit_post_#{@edit_post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(@edit_post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on "Save"

      expect(page).to have_content('Edited content')
    end
    
    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(@edit_post)

      expect(current_path).to eq(root_path)
    end
  end

  describe '#delete' do
    it 'can be deleted' do
      @post = FactoryBot.create(:post)
      visit posts_path

      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end
end