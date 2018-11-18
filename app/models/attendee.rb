class Attendee < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event

  scope :attending_at, ->(event_id) { where(event_id: event_id) }
end
