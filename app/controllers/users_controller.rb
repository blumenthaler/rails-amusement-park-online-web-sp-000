class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        if logged_in?
            @user = current_user
        else
            redirect_to '/'
        end 
    end

    private

    def user_params
        params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
    end
end