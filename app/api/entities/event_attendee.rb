module Entities
  class EventAttendee < Entities::Base
    expose :name do |attendee|
      attendee.user.name
    end

    expose :email do |attendee|
      attendee.user.email
    end

    expose :phone do |attendee|
      attendee.user.phone
    end

    expose :confirmed_at, as: :confirmedAt
  end
end