module V1
  module Defaults
    extend ActiveSupport::Concern

    included do
      version 'v1', using: :path
      format :json

      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: e.message, status: 404)
      end

      # Global exception handler, used for error notifications
      rescue_from :all do |e|
        if Rails.env.development?
          raise e
        else
          # Raven for exception logging, or something like it...
          # Raven.capture_exception(e)
          # error_response(message: "Internal server error", status: 500)
        end
      end

      # Placeholder for authentication -- Warden, Devise, etc...
      before do
        # error!('Unauthorized', 401) unless headers['Authorization'] == "some token"
      end
    end
  end
end