class UserController < ApplicationController

  # Require a logged-in user
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    # Make sure that user is viewing their own page
    if @user != current_user
      flash[:alert] = "You do not have permission to view this page."
      redirect_to(request.referrer || root_path)
    end
  end

end
