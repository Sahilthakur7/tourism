class HotspotsController < ApplicationController
    def show
    end

    def index
        @hotspot = Hotspot.new

        if params[:search]
            @hotspots = Hotspot.search(params[:search])
        else
            @hotspots = Hotspot.all
        end
    end

    def create
        @hotspot = Hotspot.new(hotspot_params)
        if @hotspot.save
        redirect_to root_path
        else
            flash[:notice] = "The hotspot already exits"
        end

    end

    private

    def hotspot_params
        params.require(:hotspot).permit(:name,:stars)
    end


end
