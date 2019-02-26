class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :location, :age, :gender, :picture, :desired_gender, :desired_age, :bio, :is_partner])
  end
end
