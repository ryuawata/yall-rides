class CarsController < ApplicationController
  before_action :skip_authorization
  def index
    @cars = policy_scope(Car)
  end

  def show
    @booking = Booking.new
    @car = authorize Car.find(params[:id])
  end

  def new
    @car = authorize Car.new
  end

  def create
    @car = Car.new(car_params)
		@car.user = current_user
		# authorize @car
    if @car.save
      redirect_to bookings_path
    else
      render :new
    end
  end

    private

    def car_params
      params.require(:car).permit(:model, :make, :year, :description, :location, :price, :photo, :user_id)
    end
end
