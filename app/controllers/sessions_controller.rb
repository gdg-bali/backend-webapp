class SessionsController < ApiController
  def create
    register_user
  end

  private

  def register_user
    @user = User.find_for_oauth(omniauth_auth_params)

    access_token = JsonWebToken.encode(public_id: @user.public_id)

    render json: user_response(access_token), status: 201
  end

  def omniauth_auth_params
    request.env['omniauth.auth']
  end

  def user_response(access_token)
    {
      id: @user.id,
      name: @user.name,
      email: @user.email,
      phone: @user.phone,
      institution: @user.institution,
      accessToken: access_token,
      rolesMask: @user.roles_mask,
      avatarUrl: @user.avatar_url
    }
  end
end