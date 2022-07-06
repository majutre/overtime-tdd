class StaticController < ApplicationController
  def index
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.pending
      @recent_audit_items = AuditLog.last(10)
    else

    end
  end
end
