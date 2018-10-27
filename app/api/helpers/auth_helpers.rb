module Helpers
  module AuthHelpers
    extend ActiveSupport::Concern
    attr_reader :current_user
    included do
      helpers do
        def current_user
          @current_user
        end

        def authenticate!
          @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
        end
      end

      rescue_from ExceptionHandler::InvalidToken do
        error!('Unauthorized. Invalid or expired token.', 401)
      end
    end
  end
end
