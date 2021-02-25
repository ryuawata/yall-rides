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
    if @review.save
      redirect_to bookings_path(@car)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :car_id, :rating)
  end
end
