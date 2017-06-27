class HotspotsController < ApplicationController
    def new
        @hotspot = Hotspot.new
    end
    
    def create
        @hotspot = Hotspot.new
        #@hotspot.user_id = current_user.id
        @hotspot.title = params[:hotspot][:title]
        @hotspot.street_address = params[:hotspot][:street_address]
        @hotspot.city = params[:hotspot][:city]
        @hotspot.state = params[:hotspot][:state]
        @hotspot.zip_code = params[:hotspot][:zip_code]
        @hotspot.phone_number = params[:hotspot][:phone_number]
        @hotspot.save
        flash[:notice] = "hotspot created succesfully"
        redirect_to new_hotspot_path
    end
end