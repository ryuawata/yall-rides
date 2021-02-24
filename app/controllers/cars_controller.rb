class CarsController < ApplicationController
  def index
    @cars = policy_scope(Car)
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @car = authorize Car.find(params[:id])
  end
end
