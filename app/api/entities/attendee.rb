module Entities
  class Attendee < Entities::Base
    expose :user_id, as: :userId
    expose :event_id, as: :eventId
    expose :registered_at, as: :registeredAt
    expose :confirmed_at, as: :confirmedAt
    expose :reasons

    expose :user, using: Entities::User
  end
end