class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      return true
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end

    def new?
      create?
    end

    def show?
      true
    end
  end
end
