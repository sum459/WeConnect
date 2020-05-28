class Devise::SessionsController < ApplicationController
  def social_login
    if !request.env["omniauth.auth"]["info"]["email"].nil?
        # Login success
        email = request.env["omniauth.auth"]["info"]["email"]
        user = User.find_by(email: email)
        if user.nil?
          # You need to signup before continuing
          flash[:danger] = "Please signup before continuing"
          redirect_to  new_user_registration_path(email: email)
        elsif !user.nil?
          
          redirect_to new_user_session_path
        end
      else
        # Login failed
        flash[:danger] = "There was an error signing you in"
        redirect_to new_user_session_path
      end
  end

  def social_failure
    flash[:danger] = "There was an error signing you in. Please try again"
    redirect_to new_user_session_path
  end
end
