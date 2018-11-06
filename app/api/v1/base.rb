module V1
  class Base < Grape::API
    helpers ::Helpers::DefaultsHelpers
    include V1::ExceptionsHandler

    mount V1::Events
    mount V1::Attendees
    mount V1::Submissions
    mount V1::Venues
    mount V1::Users
  end
end