class JsonWebToken
  HMAC_SECRET = Rails.application.credentials.secret_key_base
  ALGORITHM = 'HS256'

  def self.encode(payload, exp = 24.hours.from_now.to_i)
    JWT.encode(payload, HMAC_SECRET, ALGORITHM)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITHM }).first
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end