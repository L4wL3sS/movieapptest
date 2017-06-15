class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #05/06
  #before_action :authenticate_user!

  # add camps to users before check 29/05 USERNAME REQUIRE
  before_filter :sanitize_devise_params, if: :devise_controller?
  def sanitize_devise_params
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def after_sign_in_path_for(resource)
    #super(resource)
    if admin_user_signed_in?
    	admin_root_path
    elsif user_signed_in?     	
      settings_path
    end    
  end

end
