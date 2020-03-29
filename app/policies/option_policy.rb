class OptionPolicy < ApplicationPolicy
  def create?
    record.list.is_public? || !!user
  end
end
