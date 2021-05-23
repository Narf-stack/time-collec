FactoryBot.define do
    factory :shop do
      name { "toto" }
      slug { "toto-2" }
      id { 1 }
    end
  end

  def shop_wth_busi_hours(bs_count: 2)
    FactoryBot.create(:shop, id:20) do |shop|
      FactoryBot.create_list(:business_hour,bs_count, shop: shop)
    end
  end