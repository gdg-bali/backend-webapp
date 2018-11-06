module V1
  class Events < Base
    include ::Helpers::AuthHelpers

    resource :events do
      params do
        optional :filter, type: JSON
      end
      get do
        when_params = params.dig(:filter, :startsAt)
        events = Event.get_events(when_params)
        present events, with: Entities::Event
      end

      params do
        requires :slug_url, type: String
      end
      route_param :slug_url do
        get do
          event = Event.includes(sessions: :users).find_by(slug_url: params[:slug_url])

          raise ActiveRecord::RecordNotFound unless event.present?

          present event, with: Entities::Event, with_sessions: true
        end
      end

      params do
        requires :name, type: String
        requires :description, type: String
        requires :slugUrl, type: String
        optional :poster, type: File
        optional :meetupUrl, type: String
        optional :venueId, type: String
        optional :eventType, type: String
        optional :startsAt, type: String
        optional :endsAt, type: String
      end

      post do
        authenticate!
        authorize :event, :new?
        event = Event.new(event_params.except(:poster))
        event.cover_img_url = event_params[:poster][:tempfile]
        event.save!
        present event, with: Entities::Event
      end
    end

    helpers do
      def event_params
        req_params = declared_params.transform_keys { |key| key.to_s.underscore }
        starts_params = JSON.parse(req_params[:starts_at])
        ends_params = JSON.parse(req_params[:ends_at])
        req_params[:starts_at] = Time.zone.parse("#{starts_params['date']} #{starts_params['time']}")
        req_params[:ends_at] = Time.zone.parse("#{ends_params['date']} #{ends_params['time']}")
        req_params
      end
    end
  end
end
