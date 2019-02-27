class BookingsController < ApplicationController

  def create
    @personality = Personality.find(params[:personality_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.personality = @personality
    if @booking.save
      redirect_to dashboard_user(current_user)
    else
      render template: "personalities/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
