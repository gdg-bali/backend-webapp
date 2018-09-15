# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApiController
      def index
        @events = Event.get_events(params[:when])

        json_response(EventSerializer.new(@events))
      end
    end
  end
end
