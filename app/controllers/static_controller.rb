class StaticController < ApplicationController
  def index
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.pending
      @recent_audit_items = AuditLog.last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs.pending
    end
  end
end
