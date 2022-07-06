class StaticController < ApplicationController
  def index
    @pending_approvals = Post.where(status: 'pending')
  end
end
