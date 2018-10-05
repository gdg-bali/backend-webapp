class Identity < ApplicationRecord
  belongs_to :user

  validates :uid, :provider, presence: true

  def self.find_or_initialize_for_oauth(auth)
    find_or_initialize_by(uid: auth.uid, provider: auth.provider)
  end
end
