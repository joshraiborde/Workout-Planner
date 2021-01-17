class SessionsController < ApplicationController
    skip_before_action :redirect_if_not_logged_in # 2021-01-16 02
    # this will skip the before_action that is in the application_controller, allowing users to login

    def index 
    end

    def new
    end

    def create
        #find the user
        @user = User.find_by(username: params[:user][:username])
        #if we find the user & they have the correct password, then
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user.id) #if the user is found, redirect to the user_path(@user)
        else
            flash[:message] = "Sorry, please try again"
            redirect_to login_path
         end

    end

    def destroy
        session.clear
        redirect_to root_path # 'sessions#index'
    end
end
