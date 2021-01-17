class ApplicationController < ActionController::Base
    before_action :redirect_if_not_logged_in # 2021-01-16 02
    # the before_action will apply to everything

    helper_method :current_user, :logged_in? # 2021-01-16 02

    private # 2021-01-16 02
    # 2021-01-16 02 moved the current_user and logged_in? methods here from the app/helpers/application_helper.rb
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end

      def logged_in?
        !!current_user
      end

      def redirect_if_not_logged_in # 2021-01-16 02
        redirect_to login_path if !logged_in? # 2021-01-16 02
      end

end
