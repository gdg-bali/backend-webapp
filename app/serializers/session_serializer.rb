class SessionSerializer < BaseSerializer
  attributes :name, :duration, :starts_at

  belongs_to :user
end
