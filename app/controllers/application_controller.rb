class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, :current_user, keys: [:first_name, :last_name, :club_id, :rol_id, :email, :current_user])
      helper_method :current_user
    end
    
end


