class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def get_model(model)
    model.new
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:username, :email, :first_name, :last_name, :nickname, :password, :password_confirmation, :house_status, :room_id)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:username, :email, :first_name, :last_name, :nickname, :current_password, :password, :password_confirmation, :house_status, :room_id)
    end
  end
end
