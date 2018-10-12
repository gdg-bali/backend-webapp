# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApiController
      skip_before_action :authorize_request

      def index
        if (params[:when])
          @events = Event.includes(:venue).get_events(params[:when])
        else
          @events = Event.last
        end

        json_response(@events)
      end

      def show
        @event = Event.find_by(slug_url: params[:slug_url])

        raise ActiveRecord::RecordNotFound unless @event.present?

        json_response(@event)
      end
    end
  end
end
