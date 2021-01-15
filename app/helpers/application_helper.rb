module ApplicationHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      end

      def logged_in?
        !!current_user
      end
end
#anything in the helpers folder are only available to the respective(?) views files, unless it is specified in the controller