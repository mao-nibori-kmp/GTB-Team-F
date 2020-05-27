class TestController < ApplicationController
    def index
        @user
    end
    
    def banktest
        # ここをデータベースからトークンを入手するように変更する　@user = Database.find_by(id: params[:id]) / 
        @token = "ZDk2NzJiMDVjM2JiNjVjMGI1ZWZmZmVj"
        @balance = view_context.token_to_balance(@token)
        @transactions = view_context.token_to_transactions(@token)
    end

end
