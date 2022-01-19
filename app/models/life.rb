class Life < ApplicationRecord
    has_many :contents, dependent: :destroy
    # validates :name, {presence: true}
    # validates :year, {presence: true}
    # validates :month, {presence: true}
    # validates :date, {presence: true}
    # validates :introduce, {presence: true}
    # validates :image, {presence: true}
    validates :email, {presence: true}
    # validates :password_digest, {presence: true}
    has_secure_password
    
    # 渡されたパスワード（文字列）のハッシュ値を返す
    # https://railstutorial.jp/chapters/basic_login?version=6.0#sec-testing_layout_changes
    def Life.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
