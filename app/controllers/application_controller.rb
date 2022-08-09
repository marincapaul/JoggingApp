class ApplicationController < ActionController::Base
    include SessionsHelper

    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in first."
          redirect_to login_url
        end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
