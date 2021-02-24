class CarsController < ApplicationController
  def index
    @cars = policy_scope(Car)
  end

  def show
    @booking = Booking.new
    @car = authorize Car.find(params[:id])
  end
end
