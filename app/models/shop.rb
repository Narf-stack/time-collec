class Shop < ApplicationRecord
    has_many :business_hours, dependent: :delete_all
    validates :name, presence: true
    after_validation :set_slug, only: [:create]

    private

    def set_slug
      self.slug = (name.to_s + '-'+ rand(1...20).to_s).parameterize
    end
  
    def to_param
      slug
    end
end
