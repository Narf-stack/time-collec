require 'rails_helper'

RSpec.describe Shop, type: :model do
  
  context'validation tests'do
    it 'ensures shop name presence' do
      shop = build(:shop, name:nil)
      expect(shop).to_not be_valid
    end
    it 'should save successfully' do
      shop = Shop.new(name:'test').save
      expect(shop).to eq(true)
    end
  end

  context'method tests'do
    describe '#array_ordered_days' do
      it 'returns an array of days numbers sorted' do
        shop = create(:shop)

        arr = case Date.today.wday
              when 0
                [0,1,2,3,4,5,6]
              when 1
                [1,2,3,4,5,6,0]
              when 2
                [2,3,4,5,6,0,1]
              when 3
                [3,4,5,6,0,1,2]
              when 4
                [4,5,6,0,1,2,3]
              when 5
                [5,6,0,1,2,3,4]
              when 6
                [6,0,1,2,3,4,5]
              else
                []
              end

        expect(shop.array_ordered_days).to eql(arr)
      end
    end

    describe '#business_hours_aggregate' do
      it 'returns an hash where keys are days number and value, business hours related' do
        shop = create(:shop)
        business_hour_1 = build(:business_hour, day:1, id:22)
        business_hour_2 = build(:business_hour, day:2, id:30)

        hash_val = {
          1=> [{id:2,day:6,open:Time.now - 5.hours,
          close:Time.now + 2.hours ,
          opened:true,
          shop_id:1,
          # created_at:Thu, 13 May 2021 20:22:19 UTC +00:00,
          # updated_at:Thu, 13 May 2021 20:22:19 UTC +00:00
          }],
          2=> [{id:3,day:6,open:Time.now - 5.hours,
          close:Time.now + 2.hours ,
          opened:true,
          shop_id:1,
          # created_at:Thu, 13 May 2021 20:22:19 UTC +00:00,
          # updated_at:Thu, 13 May 2021 20:22:19 UTC +00:00
          }]
        }
        # puts "print"
        # p shop.business_hours
        # p business_hour_1
        # p shop_wth_busi_hours.business_hours
        # puts Shop.reflect_on_association(:business_hours).macro
        # expect(shop.business_hours_aggregate).to eql(hash_val)
        expect(shop_wth_busi_hours.business_hours.length).to eql(2)
      end
    end
  end
end
