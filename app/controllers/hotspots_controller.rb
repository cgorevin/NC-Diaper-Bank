class HotspotsController < ApplicationController
    before_action :authenticate_admin!, :except => [:show, :index]

    def index
      user_addr = params[:user_address]
      @current_location = Hotspot.new(street_address: user_addr[:street_address], city: user_addr[:city], zip_code: user_addr[:zip_code])
      @current_location.geocode

        if params[:user_address]
            @hotspots = Hotspot.near([@current_location.latitude, @current_location.longitude]).limit(3)
        else
            @hotspots = Hotspot.all
        end
    end

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

        redirect_to hotspots_path
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
        redirect_to hotspots_path(@hotspot)
    end

    def destroy
        @hotspot = Hotspot.find(params[:id]).destroy

            flash[:notice] = "The hotspot was deleted succesfully."

        redirect_to hotspots_path
    end

    private

    def hotspot_params
        params.require(:hotspot).permit(:title, :street_address, :city, :state, :zip_code, :phone_number)
    end

    #test
end
