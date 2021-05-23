class Shop < ApplicationRecord
    has_many :business_hours, dependent: :delete_all
    has_many :emergencies,class_name:'Emergency'
    has_many :friends,class_name:'Friend'
    validates :name, presence: true
    after_validation :set_slug, only: [:create]


    def business_hours_aggregate
      if !self.business_hours.empty?
        array_bh = business_hours_for_shop(self)
        hash_business_hours_per_shop_per_day(array_bh)
      end
    end
    
    def business_hours_for_shop(shop)
      BusinessHour.where(shop:shop)
                  .group('business_hours.day,business_hours.id')
                  .to_a.map(&:serializable_hash)
    end
  
    def hash_business_hours_per_shop_per_day(array_bh)
      array_bh.each_with_object(Hash.new []) do |bh, hash|
        hash[bh['day']] += [bh.symbolize_keys]
      end
    end
  
    def array_ordered_days
      [0,1, 2, 3, 4, 5, 6].rotate(Date.today.wday) 
    end

    private

    def set_slug
      self.slug = (name.to_s + '-'+ rand(1...20).to_s).parameterize
    end
  
    def to_param
      slug
    end
end
