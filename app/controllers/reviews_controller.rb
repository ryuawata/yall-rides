class ReviewsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @review = Review.new(car: @car)
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @car = Car.find(params[:car_id])
    @review.car = @car
    @review.user = current_user
    authorize @review
    raise
    if @review.save
      redirect_to bookings_path
    else
      @bookings_as_owner = current_user.bookings_as_owner
      @bookings = current_user.bookings
      @cars = current_user.cars
      render 'bookings/index'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :car_id, :rating)
  end
end
