class PricetagPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def offer?
    record.user != user
  end

  def accept?
    record.user == user
  end

  def destroy?
    record.user == user and not record.completed?
  end
end
