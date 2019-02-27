class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @personalities = policy_scope(Personality)
    @locations_array = [nil]
    @personalities.each do |personality|
      @locations_array << personality.user.location
    end
    @personalities = policy_scope(Personality.location(params[:location]).gender(params[:gender]))
  end
end
