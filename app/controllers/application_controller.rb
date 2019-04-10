class ApplicationController < ActionController::Base

  include Pundit
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
    def configure_permitted_parameters
      # Note: This must reference the devise path--not my own custom route
      devise_parameter_sanitizer.permit(:sign_up) do |new_user_params|
        new_user_params.permit(:email, :firstname, :lastname, :faculty, :password, :password_confirmation)
      end
    end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
