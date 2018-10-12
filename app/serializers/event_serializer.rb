class EventSerializer < BaseSerializer
  attributes :name, :description, :starts_at, :ends_at, :cover_img_url, :slug_url, :meetup_url

  belongs_to :venue
  # has_many :sessions, object_method_name: :sessions_with_user
end
