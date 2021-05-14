require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  it "displays a catch phrase" do
    visit shops_path
    page.find('.more-mb', text: 'You are at the right place')
  end
end
  
