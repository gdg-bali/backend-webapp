module Entities
  class Event < Entities::Base
    format_with(:iso_timestamp) { |dt| dt&.iso8601 }

    expose :name, :description
    expose :cover_img_url, as: :coverImgUrl do |event|
      event.cover_img_url.url
    end
    expose :slug_url, as: :slugUrl
    expose :meetup_url, as: :meetupUrl

    with_options(format_with: :iso_timestamp) do
      expose :starts_at, as: :startsAt
      expose :ends_at, as: :endsAt
    end

    expose :venue, using: Entities::Venue

    expose :sessions, if: :with_sessions do |event|
      grouped = event.sessions.group_by(&:starts_at)

      grouped.map do |date, sub_sessions|
        mapped_sessions = sub_sessions.map do |session|
          Entities::Session.represent(session)
        end
        grouped[date] = mapped_sessions
        {
          id: date.strftime('%H:%M'),
          hours: date.strftime('%H'),
          minutes: date.strftime('%M'),
          subSessions: mapped_sessions
        }
      end
    end

    expose :speakers, if: :with_sessions do |event|
      Entities::User.represent(event.sessions.map(&:users).flatten.uniq.shuffle, except: %i[email phone])
    end

    private
    def coba
      @event = object
    end
  end
end