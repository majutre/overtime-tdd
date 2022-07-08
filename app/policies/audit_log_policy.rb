class AuditLogPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def confirm?
    user?
  end

  private

  def admin?
    admin_types.include?(user.type)
  end

  def user?
    record.user_id == user.id
  end
end
