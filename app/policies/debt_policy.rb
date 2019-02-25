class DebtPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.from_user(user).merge(scope.to_user(user))
    end
  end

  def create?
    user
  end
end
