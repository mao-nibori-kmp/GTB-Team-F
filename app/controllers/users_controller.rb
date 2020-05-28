class UsersController < ApplicationController
protect_from_forgery
    def index
        @token = "1094716811490195121"
        @max_page = 10
        @prank = view_context.return_rakuten_personal_ranking(@token, @max_page)
        @prank = view_context.return_final_ranking(@prank)
        @grank = view_context.return_rakuten_search_ranking(@token)
        @recommend = view_context.propose_products(@prank, @grank)

        #@user = User.find_by(id: session[:user_id])
        # ここをデータベースからトークンを入手するように変更する　@user = Database.find_by(id: params[:id]) / 
        token = "ZDk2NzJiMDVjM2JiNjVjMGI1ZWZmZmVj"
        accountId = view_context.token_to_accountId(token)
        @balance = view_context.accountId_to_balance(accountId)

        #3ヵ月前からの入出金を @transactionsに入れる
        @dateFrom = Date.today.ago(3.month).to_s.split(nil)[0]
        @transactions = view_context.accountId_to_transactions(accountId,@dateFrom).to_json

        # 浮いたお金の計算
        @income_this_month = view_context.get_income_this_month(accountId)
        # ここで@income_this_month（今月の収入ー支出）ー貯金　で浮いたお金を算出する
        @current_user = User.find_by(id: 1)
        @deposit = @current_user.deposit

        # 浮いたお金
        @money_left_over = view_context.get_income_this_month(accountId) -  @deposit
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
