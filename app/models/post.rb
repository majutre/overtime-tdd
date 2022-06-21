class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates :date, :rationale, :overtime_request, presence: true
  validates  :overtime_request, numericality: { greater_than: 0.0}

  enum status: { pending: 0, approved: 1, rejected: 2 }

  scope :posts_by, ->(user) { where(user_id: user.id) }
end
