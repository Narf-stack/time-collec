class Contact < ApplicationRecord
  belongs_to :shop
  scope :friends , ->{where(type:'Friend')}
  scope :emergencies , ->{where(type:'Emergency')}
end
