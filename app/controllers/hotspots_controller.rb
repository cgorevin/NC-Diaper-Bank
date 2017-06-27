class HotspotsController < ApplicationController
    def new
        @hotspot = Hotspot.new
    end
    
    def create
        @hotspot = Hotspot.create(hostpot_params)

        flash[:notice] = "Hotspot created succesfully."
        redirect_to new_hotspot_path
    end
    
    private
    
    def hostpot_params
        params.require(:hotspot).permit(:title, :street_address, :city, :state, :zip_code, :phone_number)
    end
end