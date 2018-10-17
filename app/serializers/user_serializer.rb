class UserSerializer < BaseSerializer
  attributes :avatar_url, :email, :name, :access_token, :expiry, :phone

  attribute :attending_events, if: -> { instance_options[:attends_at] }

  def access_token
    instance_options[:access_token]
  end

  def expiry
    instance_options[:expiry]
  end

  def attending_events
    object.attends_at.future.map { |att| { id: att.id, name: att.name } }
  end
end
