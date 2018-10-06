class UserSerializer < BaseSerializer
  attributes :public_id, :avatar_url

  attribute :full_name do |object|
    "#{object.first_name} #{object.last_name}"
  end

  attribute :access_token do |_, params|
    params[:access_token]
  end

  attribute :expiry do |_, params|
    params[:expiry]
  end
end
