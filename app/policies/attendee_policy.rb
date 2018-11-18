class AttendeePolicy < ApplicationPolicy
  def index?
    admin?
  end

  def confirm?
    admin?
  end

  private
  def admin?
    user.super_admin? || user.admin?
  end
end