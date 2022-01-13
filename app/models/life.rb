class Life < ApplicationRecord
    has_many :contents, dependent: :destroy
    # validates :name, {presence: true}
    # validates :year, {presence: true}
    # validates :month, {presence: true}
    # validates :date, {presence: true}
    # validates :introduce, {presence: true}
    # validates :image, {presence: true}
    validates :mail, {presence: true}
    # validates :password_digest, {presence: true}
end
