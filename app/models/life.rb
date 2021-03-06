class Life < ApplicationRecord
    attr_accessor :remember_token
    has_many :contents, dependent: :destroy
    before_save {self.email = self.email.downcase}
    # https://railstutorial.jp/chapters/modeling_users?version=6.0#sec-format_validation
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :name, presence: true
    validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}, allow_nil: true
    
    # 渡されたパスワード（文字列）のハッシュ値を返す
    # https://railstutorial.jp/chapters/basic_login?version=6.0#sec-testing_layout_changes
    def Life.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # ランダムなトークンを返す
    def Life.new_token
        SecureRandom.urlsafe_base64
    end
    
    # 永続セッションのためにユーザーをデータベースに記憶する
    def remember
        self.remember_token = Life.new_token
        update_attribute(:remember_digest, Life.digest(remember_token))
    end
    
    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    # ユーザーのログイン情報を破棄する
    def forget
        update_attribute(:remember_digest, nil)
    end
end
