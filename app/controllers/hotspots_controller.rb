class HotspotsController < ApplicationController
    def new
        @hotspot = Hotspot.new
    end
    
    def create
        @hotspot = Hotspot.create(hostpot_params)

        if @hotspot.valid?
            flash[:notice] = "Hotspot created succesfully."
        else
            flash[:notice] = "Hotspot could not be saved."
        end
        
        redirect_to new_hotspot_path
    end
    
    private
    
    def hostpot_params
        params.require(:hotspot).permit(:title, :street_address, :city, :state, :zip_code, :phone_number)
    end
end