class ReviewsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @car = Car.find(params[:car_id])
    @review.car = @car
    if @review.save
      redirect_to bookings_path(@car)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :car_id)
  end
end
