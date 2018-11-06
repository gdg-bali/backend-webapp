class User < ApplicationRecord
  include OmniauthRegisterable

  ROLES = %i[super_admin admin volunteer speaker member].freeze

  has_many :identities

  has_many :attendees
  has_many :attends_at, through: :attendees, source: :event

  has_many :user_sessions
  has_many :sessions, through: :user_sessions

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

  def super_admin?
    has_role?(:super_admin)
  end

  def admin?
    has_role?(:admin)
  end
end
