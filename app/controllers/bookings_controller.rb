class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @bookings = policy_scope(Booking)
    @bookings_as_owner = current_user.bookings_as_owner
    @cars = policy_scope(current_user.cars)
    @review = Review.new
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def edit
  end

  def destroy
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :car_id, :status)
  end

  def user_params
  end
end
