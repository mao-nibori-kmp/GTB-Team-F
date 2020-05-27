class UsersController < ApplicationController
    def index
        @token = "1094716811490195121"
        @max_page = 10
        @prank = view_context.return_rakuten_personal_ranking(@token, @max_page)
        @prank = view_context.return_final_ranking(@prank)
        @grank = view_context.return_rakuten_search_ranking(@token)
        @recommend = view_context.propose_products(@prank, @grank)

    end

    #def rakutentest
    #    @token = "1094716811490195121"
    #    @balance = view_context.token_to_balance(@token)
    #end

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
