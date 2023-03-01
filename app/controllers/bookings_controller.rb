class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
    def index
      @bookings = policy_scope(Booking).all
    end

    def show
    end

    def new
       @booking = Booking.new
       authorize(@booking)
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.user = current_user

        authorize(@booking)

        if @booking.save!
          redirect_to bookings_path, notice: "Booking was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
      if @booking.update(booking_params)
        redirect_to @booking, notice: "Booking was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @booking.destroy
      redirect_to bookings_url, notice: "Booking was successfully destroyed."
    end

    private

    def set_booking
      @booking = Booking.find(params[:id])
      authorize(@booking)
    end

    def booking_params
      params.require(:booking).permit(:date, :no_of_pax)
    end
end
