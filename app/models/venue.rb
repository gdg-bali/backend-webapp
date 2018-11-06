class Venue < ApplicationRecord
  mount_uploader :logo_url, LogoUploader
end
