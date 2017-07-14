class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    if resource.class == User
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  end
  def after_sign_out_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email,:first_name,:avatar,:middle_name, :last_name,:company_name,:phone])
  end
end
