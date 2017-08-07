class TravelsController < ApplicationController
    before_action :set_user
    def index
        @travels = Travel.order('created_at').where(user_id: @user.id)
    end

    def new
        @travel = Travel.new
    end

    def create
        @travel = Travel.new(travel_params)
        @travel.set_user(current_user)
        if @travel.save
        
        redirect_to user_travels_path(current_user)
        else
            flash[:notice] = "Travel wasn't saved"
            redirect_to root_path
        end
    end

    def show
        @travel = Travel.find(params[:id]) 
        @hotspot = Hotspot.find(@travel.hotspot_id)
        @comment = Comment.new
    end


    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def travel_params
        params.require(:travel).permit(:featured_image,:title,:content,:hotspot_id)
    end
end
