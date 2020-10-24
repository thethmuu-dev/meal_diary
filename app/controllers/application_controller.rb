class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      rails_admin.dashboard_path
    else
      root_path
    end
  end
end
