class CarsController < ApplicationController
  def index
    @cars = policy_scope(Car)
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car })
      }
    end
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
		authorize @car
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
