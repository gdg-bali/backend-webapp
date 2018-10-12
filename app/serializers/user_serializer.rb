class UserSerializer < BaseSerializer
  attributes :avatar_url, :email, :name, :access_token, :expiry

  def access_token
    instance_options[:access_token]
  end

  def expiry
    instance_options[:expiry]
  end
end
