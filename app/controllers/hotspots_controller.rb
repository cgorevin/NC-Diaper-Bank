class HotspotsController < ApplicationController
    def new
        @hotspot = Hotspot.new
    end
    
    def create
        @hotspot = Hotspot.create(hotspot_params)

        if @hotspot.valid?
            flash[:notice] = "Hotspot created succesfully."
        else
            flash[:notice] = "Hotspot could not be saved."
        end
        
        redirect_to new_hotspot_path
    end
    
    def edit
        @hotspot = Hotspot.find(params[:id])
    end
    
    def update
        @hotspot = Hotspot.find(params[:id])
        if @hotspot.update_attributes(hotspot_params)
     
            flash[:notice] = "Hotspot updated succesfully."
        else
            flash[:notice] = "There was an error updating the hotspot."
        end
        
        redirect_to edit_hotspot_path(@hotspot)
    end
    
    private
    
    def hotspot_params
        params.require(:hotspot).permit(:title, :street_address, :city, :state, :zip_code, :phone_number)
    end
end