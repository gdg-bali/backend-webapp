class EventSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :name, :description, :starts_at, :ends_at, :cover_img_url, :slug_url

  belongs_to :venue

end
