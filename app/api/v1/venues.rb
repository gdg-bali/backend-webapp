module V1
  class Venues < Base
    include ::Helpers::AuthHelpers

    resource :venues do
      post do
        authenticate!
        venue = Venue.new
        authorize venue, :show?
      end
    end
  end
end
