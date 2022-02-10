module SessionsHelper
    # 特定のユーザーでログインする
    def log_in(life)
        session[:user_id] = life.id
    end
    
    # ユーザーのセッションを永続的にする
    def remember(life)
        life.remember
        cookies.permanent.signed[:user_id] = life.id
        cookies.permanent[:remember_token] = life.remember_token
    end
    
    # 現在ログイン中のユーザーを返す（いる場合）
    def current_user
        # セッション変数に値がある場合に@current_userの値を返す
        if (user_id = session[:user_id])
            @current_user ||= Life.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            life = Life.find_by(id: user_id)
            if life && life.authenticated?(cookies[:remember_token])
                log_in life
                @current_user = life
            end
        end
    end
    
    # 渡されたユーザーがカレントユーザーであればtrueを返す
    def current_life?(life)
        life && life == current_user
    end
    
    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end
    
    # 永続的セッションを破棄する
    def forget(life)
        life.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
    
    # 現在のユーザーをログアウトする
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
end
