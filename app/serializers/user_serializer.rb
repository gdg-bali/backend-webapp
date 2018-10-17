class UserSerializer < BaseSerializer
  attributes :avatar_url, :email, :name, :access_token, :expiry, :phone

  def access_token
    instance_options[:access_token]
  end

  def expiry
    instance_options[:expiry]
  end

  has_many :attendees
end
