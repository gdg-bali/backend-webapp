class VenueSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :name, :maps_url, :website_url, :logo_url
end
