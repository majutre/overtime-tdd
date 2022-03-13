require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post creation' do
    before do
      @post = Post.create(date: Date.today, rationale: 'Anything')
      @empty_post = Post.create(date: nil, rationale: nil)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date and rationale' do
      expect(@empty_post).to_not be_valid
    end
  end
end
