class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    # code to display all reviews for an experience or a booking
  end

  def create
    @booking = Booking.find(params[:booking_id])
    if @booking.user == current_user
      @review = @booking.reviews.create(review_params)

      authorize(@review)

      if @review.save!
        redirect_to @booking, notice: 'Review was successfully created.'
      else
        render :new
      end
    else
      redirect_to @booking, alert: "You are not authorized to leave a review for this booking."
    end
  end

  def edit
    # code to display the form for editing a review
  end

  def update
    if @review.update(review_params)
      redirect_to @review.booking, notice: 'Review was successfully updated.'
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
    params.require(:review).permit(:content, :user_name, :rating)
  end
end
