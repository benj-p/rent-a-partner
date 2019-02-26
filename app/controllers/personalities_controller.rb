class PersonalitiesController < ApplicationController
  before_action :set_personality, only: [:show, :edit, :update]

  def index
    @personalities = Personality.all
  end

  def show
  end

  def new
    @personality = Personality.new
  end

  def create
    @personality = Personality.new(personality_params)
    @personality.user = current_user
    if @personality.save
      redirect_to personality_path(@personality)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_personality
    @personality = Personality.find(params[:id])
  end

  def personality_params
    params.require(:personality).permit(:first_name, :last_name, :bio, :desired_gender, :desired_age, :picture, :price_per_day)
  end

end
