require 'rails_helper'

RSpec.describe "Shops", type: :request do
  describe "GET /index" do
    it 'returns a succes response' do
      get shops_path
      assert_response :success
    end
  end

  describe "GET /show" do
    it 'returns a succes response' do
      shop = create(:shop)
      business_hour = create(:business_hour)
      
      get shop_path(shop.send(:to_param))
      assert_response :success
    end
  end
end
