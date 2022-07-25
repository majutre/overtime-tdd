class Post < ApplicationRecord
  belongs_to :user, optional: true

  validates :date, :rationale, :overtime_request, presence: true
  validates  :overtime_request, numericality: { greater_than: 0.0}
  
  after_save :confirm_audit_log, if: :pending?
  after_save :un_confirm_audit_log, if: :rejected?
  
  scope :posts_by, ->(user) { where(user_id: user.id) }
  
  enum status: { pending: 0, approved: 1, rejected: 2 }

  private

  def confirm_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    audit_log.confirmed! if audit_log
  end  
  
  def un_confirm_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
    audit_log.pending! if audit_log
  end
end
