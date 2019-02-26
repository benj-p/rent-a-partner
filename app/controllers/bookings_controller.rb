class BookingsController < ApplicationController
  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_user_path(current_user)
  end
end
