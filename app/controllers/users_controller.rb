class UsersController < ApplicationController
protect_from_forgery
    def index
        #@user = User.find_by(id: session[:user_id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(users_params)
        #log_in @user
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

    def show
        logger.debug "###" + session[:user_id].to_s
    end

    private
    def users_params
        params.require(:user).permit(:mail, :nickname, :sex, :age, :deposit, :password, :genre, :token)
    end
end
