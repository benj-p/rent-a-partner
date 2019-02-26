class PagesController < ApplicationController
  def home
    @personalities = Personality.all
  end
end
