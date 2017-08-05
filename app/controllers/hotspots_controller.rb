class HotspotsController < ApplicationController
    def show
        @hotspot = Hotspot.find(params[:id])
        @photo = Photo.new
        @photos = Photo.order('created_at').where(hotspot_id: @hotspot.id)
    end

    def index
        @hotspot = Hotspot.new

        if params[:search]
            @hotspots = Hotspot.search(params[:search])
            @hash = Gmaps4rails.build_markers(@hotspots) do |hotspot, marker|
                marker.lat hotspot.latitude
                marker.lng hotspot.longitude
            end
        end
    end

    def create
        @hotspot = Hotspot.new(hotspot_params)
        if @hotspot.save
            redirect_to root_path
        else
            flash[:notice] = "The hotspot already exits"
            redirect_to hotspots_path
        end

    end

    private

    def hotspot_params
        params.require(:hotspot).permit(:name,:stars,:address)
    end


end
