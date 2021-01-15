class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) #if the all attributes are filled out, store into the instance variable @user because if it re-renders, it will reload the information that has been entered so far
        if @user.valid?
            @user.save #if it doesnt save, it will return false, invalid
            session[:user_id] = @user.id
            redirect_to user_path(@user) #if the user is saved, redirect to the user_path(@user)
        else
            render :new #if the user is not saved, render users#new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        #show the user by finding the user by the id
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
        # require the model
        # permit the attributes you want to allow in
        # strong params
    end
end
