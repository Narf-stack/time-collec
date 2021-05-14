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
end
