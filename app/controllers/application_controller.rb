class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password, :last_name, :first_name, :avatar, :avatar_cache, :admin]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
