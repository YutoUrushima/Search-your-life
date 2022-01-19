class Life < ApplicationRecord
    has_many :contents, dependent: :destroy
    validates :email, presence: true, length: {maximum: 255}
    has_secure_password
    
    # 渡されたパスワード（文字列）のハッシュ値を返す
    # https://railstutorial.jp/chapters/basic_login?version=6.0#sec-testing_layout_changes
    def Life.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
