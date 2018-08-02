class UsersController < ApplicationController
    def new
        @users = User.new
        
    end

    def show
    @users = User.find(params[:id])
    end

    def create
    @users = User.new(user_params)
        if @users.save
            log_in @users
            flash [:success] = Welcome to the secret app"
            redirect_to @users
        else
            render "new"
        end
    end

    private

    def user_params
        params.require (:user).permit(:name, :email, password_config)
    end

    
end




end
