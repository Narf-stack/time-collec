class ShopsController < ApplicationController
    def index
        @shops = Shop.all
    end
    def show
        @shop = Shop.find_by_slug(params[:slug])
        @business_hours = @shop.business_hours_aggregate
        @days_ordered = @shop.array_ordered_days
    end
end
