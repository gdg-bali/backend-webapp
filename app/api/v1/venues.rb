module V1
  class Venues < Base
    include ::Helpers::AuthHelpers

    resource :venues do
      get do
        authenticate!
        authorize :venue, :new?
        present Venue.all, with: Entities::Venue
      end

      params do
        requires :name, type: String
        requires :mapsUrl, type: String
        requires :websiteUrl, type: String
        optional :logoImg, type: File
      end
      post do
        authenticate!
        authorize :venue, :new?
        venue = Venue.new(venue_params.except(:logo_img))
        venue.logo_url = venue_params[:logo_img][:tempfile]
        venue.save!
        present venue, with: Entities::Venue
      end
    end

    helpers do
      def venue_params
        declared(params).transform_keys { |key| key.to_s.underscore }
      end
    end
  end
end
