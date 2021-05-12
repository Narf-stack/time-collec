class ShopsController < ApplicationController
    def index
        @shops = Shop.all
    end
    def show
        @shop = Shop.find_by_slug(params[:slug])
    end
end
