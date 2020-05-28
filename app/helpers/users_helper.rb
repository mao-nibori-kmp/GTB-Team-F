require 'uri'
require 'net/http'
require 'json'
require 'csv'

module UsersHelper
    def get_json_response_uri(uri)
        url = URI(uri)
        
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        
        request = Net::HTTP::Get.new(url)
        request["accept"] = 'application/json;charset=UTF-8'
        
        response = http.request(request)
        
        return JSON.parse(response.read_body)
    end

    def token_to_rakuten_genre(access_token)

        hash = get_json_response_uri("https://app.rakuten.co.jp/services/api/IchibaGenre/Search/20140222?applicationId="+access_token+"&genreId=0")

        genreNum = 1
        
        return hash["children"][genreNum]["child"]["genreName"], hash["children"][genreNum]["child"]["genreId"]
    end

    def return_rakuten_personal_ranking(access_token, max_page)

        rank_list = []

        # このユーザ情報は仮置き
        usableMoney = 10000
        age=20
        sex=0

        # ユーザの個人情報を基に楽天ランキングデータを取得
        # ageは年代20~50以上の五段階、sexは0が男性、1が女性
        max_page.times do |i|
            hash = get_json_response_uri("https://app.rakuten.co.jp/services/api/IchibaItem/Ranking/20170628?applicationId="+access_token+"&
                age="+age.to_s+"&
                sex="+sex.to_s+"&
                elements=itemCode,imageFlag,availability,imageUrl,itemUrl,itemPrice,genreId&
                page="+(i+1).to_s
            )

            # 検索したページに何も結果が含まれていないならばmax_pageまでいかずそのまま打ち切る
            if hash["Items"].nil?
                break
            end

            hash["Items"].each do |h|
                # 商品画像が存在するか、現在使えるお金分を超過していなければリストに加える
                if h["Item"]["imageFlag"] == 1 and h["Item"]["itemPrice"].to_i < usableMoney
                    product = {}
                    # 商品画像イメージは"mediumImageUrls"の一番最初にある画像を持ってくる
                    product["imageUrl"] = h["Item"]["mediumImageUrls"][0]["imageUrl"]
                    product["itemUrl"] = h["Item"]["itemUrl"]
                    product["itemPrice"] = h["Item"]["itemPrice"]
                    product["genreId"] = h["Item"]["genreId"]
                    rank_list.push product
                end
            end
            
        end

        return rank_list
    end

    def return_final_ranking(prank)
        # 楽天が提供している商品ジャンル全てをcsvファイルから読み込む
        arr = CSV.read("app/helpers/rakuten_genre.csv")

        # ハッシュ化してアクセス高速化を図る
        hash = Hash[*arr.flatten]

        # このgenre_infoは仮置き
        genre_info = [{"id"=>"200162", "Name"=>"hogehoge", "flag"=>"1"}, {"id"=>"564500", "Name"=>"hiyopiyo", "flag"=>"1"}]
        
        # 判定を高速化するためにユーザが選択したジャンルの情報だけ格納した連想配列を作る
        fav_genre = {}
        genre_info.each do |gi|
            if gi["flag"] == "1"
                fav_genre[gi["id"]] = gi["Name"]
            end
        end

        # 取得したランキング内の商品の内ユーザが選択したジャンルでないものは削除する
        pgrank = prank.select do |product|
            fav_genre.has_key?(hash[product["genreId"]])
        end

        return pgrank
    end

    def return_rakuten_search_ranking(access_token)

        rank_list = []

        # このgenre_infoは仮置き
        genre_info = [{"id"=>"200162", "Name"=>"hogehoge", "flag"=>"1"}, {"id"=>"564500", "Name"=>"hiyopiyo", "flag"=>"1"}]
        usableMoney = 10000
        ratio = 1.3 # この比率はusableMoneyに対して前後いくらまでの商品を検索するかを表す(大きければ検索幅も広がる)

        genre_info.each do |gi|
            if gi["flag"] == "1"
                genre_id = gi["id"]
                hash = get_json_response_uri("https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?applicationId="+access_token+"&minPrice="+usableMoney.div(ratio).to_s+"&maxPrice="+(usableMoney*ratio).floor.to_s+"&genreId="+genre_id+"&sort=standard")

                # 検索したページに何も結果が含まれていないならばmax_pageまでいかずそのまま打ち切る
                if hash["Items"].nil?
                    next
                end

                # とりあえず現在は1つのジャンルにつきランダムで3つ商品をピックアップする
                hash["Items"].sample(3).each do |h|
                    product = {}
                    # 商品画像イメージは"mediumImageUrls"の一番最初にある画像を持ってくる
                    product["imageUrl"] = h["Item"]["mediumImageUrls"][0]["imageUrl"]
                    product["itemUrl"] = h["Item"]["itemUrl"]
                    product["itemPrice"] = h["Item"]["itemPrice"]
                    product["genreId"] = h["Item"]["genreId"]
                    rank_list.push product
                    #return rank_list
                end
            end
        end

        return rank_list
    end

    def propose_products(prank, grank)
        # 現状ではとりあえず10個分の商品をレコメンドするようにしている
        max_recommends = 10

        # prankとgrankからそれぞれ5個ずつレコメンドする
        # もしprankの要素数が5未満であれば、足りない分をgrankで補う
        if prank.length >= 5 then
            return prank.sample(5) | grank.sample(5)
        else
            return prank | grank.sample(max_recommends-prank.length)
        end
    end
end
