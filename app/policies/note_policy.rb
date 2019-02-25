class NotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user
        scope.all
      else
        scope.where(is_public: true)
      end
    end
  end

  def show?
    user.admin? or record.user == user
  end

  def update?
    user.admin? or record.user == user
  end

  def destroy?
    update?
  end
end
