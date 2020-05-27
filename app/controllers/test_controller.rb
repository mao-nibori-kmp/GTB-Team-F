class TestController < ApplicationController
    def index
        @user
    end
    
    def banktest
        # ここをデータベースからトークンを入手するように変更する　@user = Database.find_by(id: params[:id]) / 
        @token = "ZDk2NzJiMDVjM2JiNjVjMGI1ZWZmZmVj"
        accountId = view_context.token_to_accountId(@token)
        @balance = view_context.accountId_to_balance(accountId)

        #3ヵ月前からの入出金を @transactionsに入れる
        @dateFrom = Date.today.ago(3.month).to_s.split(nil)[0]
        @transactions = view_context.accountId_to_transactions(accountId,@dateFrom)

        # 浮いたお金の計算
        @income_this_month = view_context.get_income_this_month(accountId)
        # ここで@income_this_month（今月の収入ー支出）ー貯金　で浮いたお金を算出する
    end

end
