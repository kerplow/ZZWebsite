class PlannerEventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user
        scope.all
      else
        scope.where(is_public: true)
      end
    end
  end

  def create?
    user.admin? or record.user == current_user
  end

  def update?
    user.admin? or record.user == current_user
  end

  def destroy?
    user.admin? or record.user == current_user
  end
end
