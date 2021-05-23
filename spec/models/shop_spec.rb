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
  end
end
