module LifesHelper
    # 特定のユーザーでログインする
    def log_in(life)
        session[:current_user] = life.id
    end
end
