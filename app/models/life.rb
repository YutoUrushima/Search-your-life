class Life < ApplicationRecord
    validates :name, {presence: true}
    validates :year, {presence: true}
    validates :month, {presence: true}
    validates :date, {presence: true}
    validates :mail, {presence: true}
    validates :password, {presence: true}
end