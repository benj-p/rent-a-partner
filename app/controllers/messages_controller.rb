class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message)
  end

  def show
    @message = Message.find(params[:id])
    @message.update(read: true)
    authorize @message
  end

  def new
    @message = Message.new
    @booking = Booking.find(params[:booking_id])
    @recipient = @booking.user == current_user ? @booking.personality.user : @booking.user
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @booking = Booking.find(params[:booking_id])
    @recipient = User.find(params[:message][:recipient_id].to_i)

    @message.sender = current_user
    @message.recipient = @recipient
    @message.booking = @booking

    authorize @message

    if @message.save
      redirect_to dashboard_user_path(current_user)
      flash.notice = "Message sent to #{@recipient.first_name}"
    else
      redirect_to :back
      flash.warning = "Message sending failed"
    end

  end

  def update
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content, :recipient_id)
  end
end
