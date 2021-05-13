require 'rails_helper'

RSpec.describe "Shops", type: :request do
  describe "GET /index" do
    it 'returns a succes response' do
      visit root_path
      expect(response).to be_success
    end
  end

  describe "GET /show" do
    it 'returns a succes response' do
      shop = Shop.new(name:'toto').save

      now = Time.now
      morning = Time.new(now.year, now.month, now.day, 10, 30, 0, 0)
      noon = Time.new(now.year, now.month, now.day, 15, 00, 0, 0)
      business_hour = BusinessHour.new(day:3, open:morning, close:noon, shop:shop).save

      visit shop_path(shop)
      expect(response).to be_success
    end
  end
end
