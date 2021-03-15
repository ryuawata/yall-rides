class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def new?
      create?
    end

    def create?
      record.car.bookings.find_by(user: user)
    end

end
