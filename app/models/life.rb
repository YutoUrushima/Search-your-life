class Life < ApplicationRecord
    validates :name, {presence: true}
    validates :year, {presence: true}
    validates :month, {presence: true}
    validates :date, {presence: true}
    validates :introduce, {presence: true}
    validates :image, {presence: true}
end
