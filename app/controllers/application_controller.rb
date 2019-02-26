class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :password, :email, :location, :age, :gender, :picture, :desired_gender, :desired_age, :bio, :is_partner])
  end

  def after_sign_up_path_for(resource)
    root_path_for(resource)
  end
end
