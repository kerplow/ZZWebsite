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
    record.user != user and record.listed?
  end

  def accept?
    record.user == user and record.listed?
  end

  def destroy?
    record.user == user and record.listed?
  end
end
