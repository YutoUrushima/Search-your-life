module LifesHelper
    include SessionsHelper
    
    # ユーザーのプロフィール画像を返却する
    def profile_image(life)
        life.image != nil ? life.image : "/user_images/default.jpg"
    end
    
    # 現在表示中のページのユーザーのidとログイン中のユーザーidがあってるか確認(showページでの編集ボタンなどの表示確認用)
    def match_correct_life?(life)
        current_user && life.id == current_user.id
    end
    
    # ユーザーの年齢を表示する
    # https://qiita.com/aqril_1132/items/46e824541e657190ef3e#%E5%B0%8F%E8%A9%B1---%E5%B9%B4%E3%82%92%E3%81%A8%E3%82%8B%E7%9E%AC%E9%96%93
    def display_life_age(life)
        Time.zone = "Asia/Tokyo"
        # 現在時刻のyyyymmdd
        fomatted_time = Time.zone.now.to_formatted_s(:number).slice!(0...8)
        # 月と日は0paddingで2桁に揃える
        month = sprintf("%02d", life.month)
        date = sprintf("%02d", life.date)
        # 誕生日のyyyymmdd
        the_birthday = (life.year.to_s + month.to_s + date.to_s).to_i
        # 現在の年齢
        the_age = ((fomatted_time.to_i - the_birthday) / 10000).floor
        return the_age
    end
end
