class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

   # def after_sign_in_path_for(users)
   #  authenticated_root_path
   # end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :user_name, :contact, :email, :password, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :user_name, :contact, :email, :password, :current_password, :avatar]) 
  end

  

end
