require 'uri'
require 'net/http'
require 'json'
require 'date'

module ApplicationHelper


    def token_to_accountId(x_access_token)
        # トークンから口座IDを取得
        $x_access_token = x_access_token


        url = URI("https://api.sunabar.gmo-aozora.com/personal/v1/accounts")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-access-token"] = $x_access_token
        request["accept"] = 'application/json;charset=UTF-8'

        response = http.request(request)

        hash = JSON.parse(response.read_body)
        accountId = hash["accounts"][0]["accountId"]

        return accountId
    end



    # ＝＝＝＝＝＝＝＝＝＝＝＝＝＝残高参照＝＝＝＝＝＝＝＝＝＝＝＝＝＝


    def accountId_to_balance(accountId)

        # 残高取得
        accountId = accountId.to_s
        
        url = URI("https://api.sunabar.gmo-aozora.com/personal/v1/accounts/balances?accountId=" + accountId)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-access-token"] = $x_access_token
        request["accept"] = 'application/json;charset=UTF-8'

        response = http.request(request)


        hash = JSON.parse(response.read_body)

        return hash["balances"][0]["balance"].to_i
    end


    # def token_to_balance(x_access_token)
    #     return accountId_to_balance(token_to_accountId(x_access_token))
    # end


    # ＝＝＝＝＝＝＝＝＝＝＝＝＝＝入出金参照＝＝＝＝＝＝＝＝＝＝＝＝＝＝


    # dateFromはString型

    def accountId_to_transactions(accountId,dateFrom)

        url = URI("https://api.sunabar.gmo-aozora.com/personal/v1/accounts/transactions?accountId=" + accountId + "&dateFrom=" + dateFrom)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-access-token"] = $x_access_token
        request["accept"] = 'application/json;charset=UTF-8'

        response = http.request(request)

        hash = JSON.parse(response.read_body)
        transactions_count = hash["count"].to_i


        transactions = []

        for num in 0..transactions_count-1 do
            

            transaction = hash["transactions"][num]
            transactionType = transaction["transactionType"]



            # 日付を追加
            valueDate = transaction["valueDate"]
            valueDate = Date.parse(valueDate)


            # 入金か出勤判定
            if transactionType == "1"
                # 入金
                income = true
            elsif transactionType == "2"
                # 出金
                income = false
            else
                income =  "エラーでござる"
            end

            # 金額を追加
            amount = transaction["amount"].to_i

            

            transaction_hash = {valueDate: valueDate  , transactionType: income  , amount: amount}

            transactions.push(transaction_hash)

        end

        return transactions.sort_by! { |a| a[:valueDate] }.reverse
    end


    def get_income_this_month(accountId)
        dateFrom = Date.today.beginning_of_month.to_s
    
        url = URI("https://api.sunabar.gmo-aozora.com/personal/v1/accounts/transactions?accountId=" + accountId + "&dateFrom=" + dateFrom )
    
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
        request = Net::HTTP::Get.new(url)
        request["x-access-token"] = $x_access_token
        request["accept"] = 'application/json;charset=UTF-8'
    
        response = http.request(request)
    
        hash = JSON.parse(response.read_body)
        transactions_count = hash["count"].to_i
    
        income = 0
    
        for num in 0..transactions_count-1 do
            
    
            transaction = hash["transactions"][num]
            transactionType = transaction["transactionType"]
            if transactionType == "1"
                income += transaction["amount"].to_i
            else
                income -= transaction["amount"].to_i
            end
    
        end
    
        return income
    
    end




end