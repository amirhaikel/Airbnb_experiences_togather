class BookingsController < ApplicationController
  before_action :set_experience, only: %i[index new create show]
  def index
    @bookings = policy_scope(@experience.bookings)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize(@booking)
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = Booking.new
    authorize(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.experience = @experience

    authorize(@booking)

    if @booking.save!
      redirect_to experience_booking_path(@experience, @booking), notice: "Booking was successfully placed."
    else
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to experience_booking_path(@experience, @booking) , notice: "Booking was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to experience_bookings_path, notice: "Booking was successfully destroyed."
  end
  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_date)
  end

end
