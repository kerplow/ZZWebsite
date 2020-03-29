class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    !!user
  end

  def new?
    create?
  end

  def update?
    !!user && (user.admin? || record.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    !!user && (user.admin? || record.user == user)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
