class ShopsController < ApplicationController
    def index
        @shops = Shop.all
    end
    def show
        @shop = Shop.find_by_slug(params[:slug])
        @business_hours = @shop.business_hours_aggregate
        @days_ordered = @shop.array_ordered_days
        @friends = @shop.friends
    end

    def new_contact
        @shop = Shop.find_by_slug(params['shop_slug'])

        if params['type'] == 'friends'
            @contact = @shop.friends.new
            path = 'new_friend'
        else 
            @contact = @shop.emergencies.new
            path = 'new_emergency'
        end
        respond_to do |format|
            # format.json { render layout: false, content_type: 'text/javascript'}
            format.js { render path}
            # format.js { render 'new_contact',:locals => {:@contact => @contact, :@shop => @shop} }
            # format.json { render json: @contact}
        end
    end
end
