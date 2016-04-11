class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_sanitized_params, if: :devise_controller?

  def configure_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) << :username  << :bio << :avatar
    devise_parameter_sanitizer.for(:account_update) << :username  << :bio << :avatar
  end
end
