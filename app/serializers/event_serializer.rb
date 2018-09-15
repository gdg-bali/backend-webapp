class EventSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :name, :description, :starts_at, :ends_at, :venue, :cover_img_url, :slug_url

end
