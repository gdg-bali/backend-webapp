module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable

    rescue_from ActiveRecord::RecordNotFound do |err|
      json_response({ message: 'Does not exists' }, :not_found)
    end
  end

  private

  def unprocessable(err)
    json_response({ message: err.message }, :unprocessable_entity)
  end

  def unauthorized_request(err)
    json_response({ message: err.message }, :unauthorized)
  end
end