require 'rails_helper'

RSpec.describe "shops/show", type: :view do

  it "displays a business hours " do
    shop = create(:shop)
    visit shop_path(shop.send(:to_param))
    page.find('.title', text: 'Horaires')
  end
end
