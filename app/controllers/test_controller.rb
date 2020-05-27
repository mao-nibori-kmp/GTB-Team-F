class TestController < ApplicationController
    def index
        @user
    end
    
    def banktest
        # ここをデータベースからトークンを入手するように変更する　@user = Database.find_by(id: params[:id]) / 
        @token = "ZDk2NzJiMDVjM2JiNjVjMGI1ZWZmZmVj"
        @balance = view_context.token_to_balance(@token)

        #3ヵ月前
        @dateFrom = Date.today.ago(3.month).to_s.split(nil)[0]
        @transactions = view_context.token_to_transactions(@token,@dateFrom)
    end

end
