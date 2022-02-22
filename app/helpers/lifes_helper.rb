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
    
    # ユーザーの年齢を返す
    def get_life_age(life)
        # lifeモデルのyear, month, dateのいずれもnilでない場合に実行
        if !life.year.nil? && !life.month.nil? && !life.date.nil?
            Time.zone = "Asia/Tokyo"
            # 現在時刻のyyyymmdd
            fomatted_time = Time.zone.now.to_formatted_s(:number).slice!(0...8)
            # 現在の年/月/日
            current_year = fomatted_time.slice!(0...4).to_i
            current_month = fomatted_time.slice!(0...2).to_i
            current_date = fomatted_time.slice!(0...2).to_i
            # 今年にthe_age歳になるので、月日によって条件分岐
            the_age = current_year - life.year
            if life.month > current_month
                the_age -= 1
            elsif life.month == current_month
                the_age -= 1 if life.date > current_date
            end
            return the_age
        else
            return false
        end
    end
end
