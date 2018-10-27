class VenuePolicy < ApplicationPolicy
  def create?
    binding.pry
    true
  end
end