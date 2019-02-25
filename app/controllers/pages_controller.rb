class PagesController < ApplicationController
  def home
    flash.now[:alert] = "dummy alert"
    flash.now[:notice] = "dummy success"
  end
end
