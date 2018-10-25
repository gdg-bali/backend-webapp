module V1
  module Defaults
    extend ActiveSupport::Concern

    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end

    included do
      version 'v1', using: :path
      format :json

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({ error: 'Not Found' }, 404)
      end

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error!({ messages: e.full_messages }, 400)
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

      helpers do
        def authenticate!
          @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
          error!('Unauthorized. Invalid or expired token.', 401) unless @current_user
        end
      end
    end
  end
end