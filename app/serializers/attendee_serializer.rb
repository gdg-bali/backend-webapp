class AttendeeSerializer < BaseSerializer

  attributes :registered_at, :confirmed_at

  belongs_to :user
  belongs_to :event
end
