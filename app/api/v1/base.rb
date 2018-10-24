module V1
  class Base < Grape::API
    mount V1::Events
    mount V1::Attendees
    mount V1::Volunteers

    rescue_from ActiveRecord::RecordNotFound do |err|
      binding.pry
      json_response({ message: 'Does not exists' }, :not_found)
    end
  end
end