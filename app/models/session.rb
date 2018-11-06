class Session < ApplicationRecord
  default_scope { order(starts_at: :asc) }

  belongs_to :event

  has_many :user_sessions
  has_many :users, through: :user_sessions
end
