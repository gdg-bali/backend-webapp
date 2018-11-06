module Entities
  class Session < Entities::Base
    expose :name, :duration
    # expose :description
    expose :session_type, as: :sessionType

    expose :hours do |session|
      session.starts_at&.strftime('%H')
    end

    expose :minutes do |session|
      session.starts_at&.strftime('%M')
    end

    expose :users do |session|
      Entities::User.represent(session.users, except: %i[email phone])
    end
  end
end