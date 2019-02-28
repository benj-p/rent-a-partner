class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
    @booking = params[:booking]
  end

  def create
    @booking = Booking.find(params[:booking].to_i)
    @personality = @booking.personality
    @user = @booking.user
    @review = Review.new(review_params)
    @review.user = @user
    @review.personality = @personality
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to dashboard_user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @booking = params[:booking]
    @review = Booking.find(params[:booking].to_i).review
    authorize @review
  end

  def update
    @booking = params[:booking]
    @review = Booking.find(params[:booking].to_i).review
    authorize @review
    if @review.update_attributes(review_params)
      redirect_to dashboard_user_path(current_user)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:personality_rating, :personality_comment, :user_rating, :user_comment, :user_id, :personality_id, :booking_id)
  end
end
