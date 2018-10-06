class SessionsController < ApiController
  skip_before_action :authorize_request

  def create
    register_user
  end

  private

  def register_user
    user = User.find_for_oauth(omniauth_auth_params)

    access_token, expiry = JsonWebToken.encode(public_id: user.public_id)
    user_json = UserSerializer.new(user, params: access_token_hash(access_token, expiry))

    json_response(user_json, 201)
  end

  def omniauth_auth_params
    request.env['omniauth.auth']
  end

  def access_token_hash(access_token, expiry)
    {
      access_token: access_token,
      expiry: expiry
    }
  end
end