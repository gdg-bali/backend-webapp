module Entities
  class Event < Entities::Base
    expose :name, :description
    expose :starts_at, as: :startsAt
    expose :ends_at, as: :endsAt
    expose :cover_img_url, as: :coverImgUrl
    expose :slug_url, as: :slugUrl
    expose :meetup_url, as: :meetupUrl
  end
end