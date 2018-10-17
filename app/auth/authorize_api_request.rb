class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    {
      user: user
    }
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find_by_public_id(decoded_auth_token[:public_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound => err
    raise(
      ExceptionHandler::InvalidToken,
      ("#{Message.invalid_token} #{err.message}")
    )
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    auth_headers = headers['Authorization']

    return auth_headers.split(' ').last if auth_headers.present?

    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end
end
