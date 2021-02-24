class CarsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]
	
  def index
    @cars = policy_scope(Car)
  end

  def show
    @booking = Booking.new
    @car = authorize Car.find(params[:id])
  end
end
