class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    # code to display all reviews for an experience or a booking
  end

  def show
    @booking = Booking.find(params[:booking_id])
    authorize(@review)
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @experience = Experience.find(@booking.experience_id)
    @review = @booking.reviews.build
    authorize(@review)
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @experience = Experience.find(@booking.experience_id)
    @review = @booking.reviews.build(review_params)
    if @booking.user != current_user
      redirect_to @booking, alert: "You are not authorized to leave a review for this booking."
      return
    end

    @review.user_name = @booking.user_name
    @review.experience = @experience

    authorize(@review)

    if @review.save
      redirect_to experience_booking_path(@experience, @booking), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:booking_id])
    authorize(@review)
  end

  def update
    authorize(@review)
    if @review.update(review_params)
      redirect_to experience_booking_path(@review.experience_id, @review.booking_id), notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.booking, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
