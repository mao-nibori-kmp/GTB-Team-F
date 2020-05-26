class UsersController < ApplicationController
    def index
        
    end

    def new
        @user = Users.new
    end

    def create
        @user = Users.create(users_params)
        redirect_to users_path
    end

    def edit
        @user = Users.find(params[:id])
    end

    def update
        @user = Users.find(params[:id])
        @user.update(users_params)
        redirect_to users_path
    end

    def destroy
        @user = Users.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private
    def users_params
        params.require(:user).permit(:mail, :nickname, :sex, :age, :deposit, :password_digest)
    end
end
