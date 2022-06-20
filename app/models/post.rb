class Post < ApplicationRecord
  belongs_to :user, optional: true
  validates :date, :rationale, presence: true

  enum status: { pending: 0, approved: 1, rejected: 2 }

  scope :posts_by, ->(user) { where(user_id: user.id) }
end
