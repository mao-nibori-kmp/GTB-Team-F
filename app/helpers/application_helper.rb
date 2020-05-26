require 'uri'
require 'net/http'
require 'json'

module ApplicationHelper
    
    def token_to_balance(x_access_token)

        # トークンから口座IDを取得
        url = URI("https://api.sunabar.gmo-aozora.com/personal/v1/accounts")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-access-token"] = x_access_token
        request["accept"] = 'application/json;charset=UTF-8'

        response = http.request(request)

        hash = JSON.parse(response.read_body)


        # 残高取得
        accountId = hash["accounts"][0]["accountId"]
        url = URI("https://api.sunabar.gmo-aozora.com/personal/v1/accounts/balances?accountId=" + accountId)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-access-token"] = x_access_token
        request["accept"] = 'application/json;charset=UTF-8'

        response = http.request(request)
        # puts response.read_body


        hash = JSON.parse(response.read_body)

        return hash["balances"][0]["balance"].to_i
    end
end
