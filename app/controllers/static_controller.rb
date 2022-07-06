class StaticController < ApplicationController
  def index
    @pending_approvals = Post.where(status: 'pending')
    @recent_audit_items = AuditLog.last(10)
  end
end
