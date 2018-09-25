class Session < ApplicationRecord
  default_scope { order(starts_at: :asc) }

  belongs_to :event
  belongs_to :user
end
