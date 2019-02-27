class PersonalitiesController < ApplicationController
  before_action :set_personality, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @personalities = policy_scope(Personality)
    @locations_array = [nil]
    @personalities.each do |personality|
      @locations_array << personality.user.location
    end
    @personalities = policy_scope(Personality.match_search_terms(params[:q])
                    .location(params[:location]).gender(params[:gender]))
  end

  def show
    authorize @personality
    @user = @personality.user
    @personalities = @user.personalities
  end

  def new
    if params[:partner] == "true"
      current_user.update(is_partner: true)
      flash.notice = "Congrats! You're now a partner, you can start adding personalities."
    end
    @personality = Personality.new
    authorize @personality
  end

  def create
    @personality = Personality.new(personality_params)
    @personality.user = current_user
    authorize @personality
    if @personality.save
      redirect_to personality_path(@personality)
    else
      render :new
    end
  end

  def edit
    authorize @personality
  end

  def update
    #TODO
  end

  def destroy
    #TODO
  end

  private

  def set_personality
    @personality = Personality.find(params[:id])
  end

  def personality_params
    params.require(:personality).permit(:first_name, :last_name, :bio, :desired_gender, :desired_age, :picture, :price_per_day)
  end
end
