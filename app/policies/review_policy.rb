class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def new?
      true
    end

    def create?
      record.car.bookings.find_by(user: user)
    end

end
