class SessionsController < ApplicationController

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
