require 'rails_helper'

describe 'navigation to' do
  describe 'index' do
    it 'can be reached succesfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    
    it 'has a title of Posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
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
  end
end