class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # add camps to users before check 29/05
  before_filter :sanitize_devise_params, if: :devise_controller?
  def sanitize_devise_params
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
