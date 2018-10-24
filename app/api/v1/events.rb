module V1
  class Events < Grape::API
    include V1::Defaults

    resource :events do
      params do
        optional :filter, type: JSON
      end
      get do
        when_params = params.dig(:filter, :startsAt)
        events = when_params ? Event.get_events(when_params) : Event.all
        present events, with: Entities::Event
      end

      params do
        requires :slug_url, type: String
      end
      route_param :slug_url do
        get do
          event = Event.find_by(slug_url: params[:slug_url])

          raise ActiveRecord::RecordNotFound unless event.present?

          present event, with: Entities::Event
        end
      end
    end
  end
end
