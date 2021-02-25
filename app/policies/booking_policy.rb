class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      @user.bookings
    end
  end
  
  def create?
    return true
  end

  def update?
    record.car.user == user
  end

  def destroy?
    record.user == user
  end
end
