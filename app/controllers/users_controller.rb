class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard]

  def dashboard
    authorize @user
    @bookings_upcoming = @user.bookings.where("DATE(date) >= ?", Date.today)
    @bookings_past = @user.bookings.where("DATE(date) < ?", Date.today)
    @messages = Message.where(recipient: @user).order("created_at DESC")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
