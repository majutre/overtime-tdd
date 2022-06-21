class PostPolicy < ApplicationPolicy
  def update?
    return true if admin?
    return true if user? && !post_approved?
  end

  private

  def user?
    record.user_id == user.id
  end

  def admin?
    admin_types.include?(user.type)
  end

  def post_approved?
    record.approved?
  end
end
