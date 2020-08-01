class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception #add 31_07
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :club_id, :rol_id, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :club_id, :rol_id, :email]) #add 31_07
    end
end


