module SessionsHelper
    # 特定のユーザーでログインする
    def log_in(life)
        session[:current_user] = life.id
    end
    
    # 現在ログイン中のユーザーを返す（いる場合）
    def current_user
        # セッション変数に値がある場合に@current_userの値を返す
        if session[:current_user]
            # @current_userに値があれば（すでに@current_userに値がセットされている場合)@current_userを返し、
            # @current_userに値がなければ（ログインした直後でセッション変数はあるけど、@current_userに値がセットされていない場合）@current_userにセッション変数を代入して返す
            @current_user ||= Life.find_by(id: session[:current_user])
        end
    end
    
    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end
    
    # 現在のユーザーをログアウトする
    def log_out
        session.delete(:current_user)
        @current_user = nil
    end
end
