require 'rails_helper'

describe 'navigation to' do
  let(:user) { FactoryBot.create(:user) }
  let(:post) do
    Post.create(
      date: Date.today, 
      rationale: 'Test rationale', 
      user_id: user.id
    )
  end

  before do
    login_as(user, :scope => :user)
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
      post1 = FactoryBot.build(:post)
      post2 = FactoryBot.build(:second_post)
      post1.update(user_id: user.id)
      post2.update(user_id: user.id)
      visit posts_path
      expect(page).to have_content(/rationale1|rationale2/)
    end

    it 'has scope so only post creators can see their posts' do
      post_from_other_user = FactoryBot.create(:post_from_other_user)

      visit posts_path

      expect(page).to_not have_content(/Post from other user/)
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
    it 'can be reached by clicking link on index page' do
      post_to_edit = Post.create(date: Date.today, rationale: "Edit test", user_id: user.id, overtime_request: 3.5)
      visit posts_path

      click_link("edit_post_#{post_to_edit.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on "Save"

      expect(page).to have_content('Edited content')
    end
    
    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_post_path(post)

      expect(current_path).to eq(root_path)
    end
  end

  describe '#delete' do
    it 'can be deleted' do
      post_to_delete = Post.create(date: Date.today, rationale: 'Delete rationale', user_id: user.id, overtime_request: 1.0)

      visit posts_path

      click_link("delete_post_#{post_to_delete.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end
end