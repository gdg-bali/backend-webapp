class VolunteerSerializer < BaseSerializer

  attributes :registered_at

  belongs_to :user
  belongs_to :event
end
