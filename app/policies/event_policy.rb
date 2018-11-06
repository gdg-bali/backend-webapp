class EventPolicy < ApplicationPolicy
  def new?
    user.super_admin? || user.admin?
  end
end