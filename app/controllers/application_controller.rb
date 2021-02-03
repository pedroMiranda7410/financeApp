class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :current_date

    def current_user
      if User.first != nil && session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end

    def current_date
        @current_date = Date.today
    end

    def authenticate
        redirect_to(login_path) unless current_user
    end
end
