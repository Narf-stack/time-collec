class ContactsController < ApplicationController
    before_action :set_shop, only: [:new,:create]
    def new
        @contact = @shop.send(set_type.pluralize).new
    end

    def create
        @contact = @shop.send(set_type.pluralize).new(contact_params)
    end

    def edit
    end
    def update
    end


    def destroy
    end

    private
    def set_shop
        @shop = Shop.find_by_slug(params[:shop_slug])
    end

    def contact_params
        params.require(set_type.to_sym).permit(:type,:first_name,:last_name,:phone_number)
    end
    def set_type
        case params[:type]
        when 'Friend'
            'friend'
        when 'Emergency'
            'emergency'
        end
    end

end
