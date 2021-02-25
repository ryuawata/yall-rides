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
    if params[:query].present?
      @cars = Car.search_by_car_details(params[:query])
    end
  end

  def show
    @booking = Booking.new
    @car =  Car.find(params[:id])
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
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

  def destroy
    @car = Car.find(params[:id])
    authorize @car
    @car.delete
  end

  def edit
    @car = Car.find(params[:id])
    authorize @car
  end

  def update
    @car = Car.find(params[:id])
    authorize @car
    if @car.update(car_params)
      redirect_to bookings_path, notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end


  private

  def car_params
    params.require(:car).permit(:model, :make, :year, :description, :location, :price, :photo, :user_id)
  end
end
