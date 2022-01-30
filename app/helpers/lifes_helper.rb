module LifesHelper
    # ユーザーのプロフィール画像を返却する
    def profile_image(life)
        life.image != nil ? life.image : "/user_images/default.jpg"
    end
end
