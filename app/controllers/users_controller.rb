class UsersController < ApplicationController
    def index
        
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(users_params)
        redirect_to users_path
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(users_params)
        redirect_to users_path
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
    def users_params
        params.require(:user).permit(:mail, :nickname, :sex, :age, :deposit, :password_digest)
    end
end
