# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApiController
      def index
        @events = Event.get_events(params[:when])

        json_response(EventSerializer.new(@events))
      end

      def show
        @event = Event.find_by(slug_url: params[:slug_url])

        json_response(EventSerializer.new(@event, include: [:venue] ))
      end
    end
  end
end
