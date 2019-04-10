class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  protect_from_forgery

  protected
    def configure_permitted_parameters
      # Note: This must reference the devise path--not my own custom route
      devise_parameter_sanitizer.permit(:sign_up) do |new_user_params|
        new_user_params.permit(:email, :firstname, :lastname, :faculty, :password, :password_confirmation)
      end
    end

end
