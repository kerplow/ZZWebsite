class ListPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.admin? or record.user == current_user
  end

  def destroy?
    user.admin? or record.user == current_user
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.includes(:options).where(options: { list: { allowed_voters: user } })
      end
    end
  end
end
