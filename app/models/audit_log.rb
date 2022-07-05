class AuditLog < ApplicationRecord
  belongs_to :user

  validates :user_id, :status, :start_date, presence: true

  after_initialize :set_defaults

  enum status: { pending: 0, confirmed: 1 }

  private

  def set_defaults
    self.start_date ||= (Date.today - 6.days)
  end
end
