# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApiController
      def index
        @events = Event.includes(:venue).get_events(params[:filter][:when])

        json_response(EventSerializer.new(@events, include: [:venue]))
      end

      def show
        @event = Event.find_by(slug_url: params[:slug_url])

        raise ActiveRecord::RecordNotFound unless @event.present?

        response = EventSerializer.new(@event, include: %i[venue sessions.user])

        json_response(response)
      end
    end
  end
end
