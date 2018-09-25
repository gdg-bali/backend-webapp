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
        
        if @event.nil?
          raise ActiveRecord::RecordNotFound
        else
          response = EventSerializer.new(@event, include: [:venue, :'sessions.user']).serializable_hash

          # THIS IS A TERRIBLE HACK
          # TODO: Remove when this will be used with GraphQL
          users = response[:included].partition { |h| h[:type] == :user }.tap { |_, rest| response[:included] = rest }.first
          response[:included].map do |item|
            if item[:type] == :venue
              item
            else
              user_id = item[:relationships][:user][:data][:id]
              item.delete(:relationships)
              item.tap { |x| x[:attributes][:user] = users.find { |user| user[:id] == user_id }[:attributes] }
            end
          end
          
          json_response(response)
        end
      end
    end
  end
end
