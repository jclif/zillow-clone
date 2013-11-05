class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

  private

    def require_login
      unless current_user
        redirect_to new_user_session_url
      end
    end
end
