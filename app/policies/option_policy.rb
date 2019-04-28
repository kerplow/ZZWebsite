class OptionPolicy < ApplicationPolicy
  def destroy?
    user.admin? || record.user == user || record.list.user == user
  end

  def update?
    user.admin? || record.user == user || record.list.user == user
  end
end
