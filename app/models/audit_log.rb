class AuditLog < ApplicationRecord
  belongs_to :user

  validates :user_id, :status, :start_date, presence: true

  after_initialize :set_defaults
  before_update :set_end_date, if: :confirmed?

  scope :by_start_date, -> { order('start_date DESC') }

  enum status: { pending: 0, confirmed: 1 }

  private

  def set_defaults
    self.start_date ||= (Date.today - 6.days)
  end

  def set_end_date
    self.end_date = Date.today
  end
end
