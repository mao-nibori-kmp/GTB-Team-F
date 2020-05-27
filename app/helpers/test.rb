require 'uri'
require 'net/http'
require 'json'
require 'date'

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


    def token_to_balance(x_access_token)
        return accountId_to_balance(token_to_accountId(x_access_token))
    end



    def accountId_to_transactions_this_month(accountId)

        d = Date.today
        today_month = d.month.to_s

        # 1 月から９月の時は先頭に0を付ける
        if today_month.length == 1
            today_month = "0".concat(today_month)

        end
        today_year = d.year.to_s


        url = URI("https://api.sunabar.gmo-aozora.com/personal/v1/accounts/transactions?accountId=" + accountId + "&dateFrom=" +today_year + "-" + today_month + "-01")

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

        return transactions
    end

    def token_to_transactions(x_access_token)
        return accountId_to_transactions_this_month(token_to_accountId(x_access_token))
    end




print token_to_transactions("ZDk2NzJiMDVjM2JiNjVjMGI1ZWZmZmVj")
puts 