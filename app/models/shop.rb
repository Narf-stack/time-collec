class Shop < ApplicationRecord
    has_many :business_hours, dependent: :delete_all
    validates :name, presence: true
end
