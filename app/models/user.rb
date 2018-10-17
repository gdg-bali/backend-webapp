class User < ApplicationRecord
  include OmniauthRegisterable

  ROLES = %i[super_admin admin volunteer speaker member].freeze

  has_many :sessions
  has_many :identities

  has_many :attendees
  has_many :attends_at, through: :attendees, source: :event

  has_many :volunteers
  has_many :volunteers_at, through: :volunteers, source: :event

  has_many :speakers
  has_many :speaks_at, through: :speakers, source: :event

  has_secure_token :public_id

  validates :name, :email, presence: true

  def roles=(roles)
    roles = [*roles].map(&:to_sym)
    self.roles_mask = (roles & ROLES).map { |role| 2**ROLES.index(role) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |role|
      ((roles_mask.to_i || 0) & 2**ROLES.index(role)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end
end
