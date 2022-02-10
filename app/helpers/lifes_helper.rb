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
end
