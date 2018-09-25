class UserSerializer < BaseSerializer

  attribute :fullName do |object|
    "#{object.first_name} #{object.last_name}"
  end

end
