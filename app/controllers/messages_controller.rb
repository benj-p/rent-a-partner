class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message)
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
