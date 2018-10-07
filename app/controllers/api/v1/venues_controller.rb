# frozen_string_literal: true

module Api
  module V1
    class VenuesController < ApiController
      skip_before_action :authorize_request

      def index
        @venues = Venue.all

        json_response(VenueSerializer.new(@venues))
      end

      def create
        @venue = Venue.new(venue_attributes)

        if @venue.save
          json_response(VenueSerializer.new(@venue), :created)
        end
      end

      private

      def venue_params
        params.require(:data).permit(:type, {
          attributes: [:name, :maps_url, :logo_url, :website_url]
        })
      end

      def venue_attributes
        venue_params[:attributes] || {}
      end
    end
  end
end
