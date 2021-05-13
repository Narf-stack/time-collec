require 'rails_helper'

RSpec.describe Shop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  context'validation tests'do
    it 'ensures shop name presence' do
      shop = Shop.new().save
      expect(shop).to eq(false)
    end
    it 'should save successfully' do
      shop = Shop.new(name:'test').save
      expect(shop).to eq(true)
    end
  end
end
