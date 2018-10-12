class User < ApplicationRecord
  include OmniauthRegisterable

  ROLES = %i[super_admin admin volunteer speaker member]

  has_many :sessions
  has_many :identities

  has_many :attendees
  has_many :events, through: :attendees

  has_secure_token :public_id

  validates :name, :email, presence: true

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
  
  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end
end
