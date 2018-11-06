module Entities
  class Venue < Entities::Base
    expose :name
    expose :maps_url, as: :mapsUrl
    expose :website_url, as: :websiteUrl
    expose :logo_url, as: :logoUrl do |venue|
      venue.logo_url.url
    end
  end
end