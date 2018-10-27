module V1
  class Base < Grape::API
    helpers ::Helpers::DefaultsHelpers
    include V1::ExceptionsHandler

    mount V1::Events
    mount V1::Attendees
    mount V1::Volunteers
    mount V1::Venues
  end
end