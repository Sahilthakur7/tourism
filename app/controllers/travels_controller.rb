class TravelsController < ApplicationController
    def index
        if on_user_path
            @user = User.find(params[:user_id])
            @travels = Travel.order('created_at').where(user_id: @user.id)
        else
            @hotspot = Hotspot.find(params[:hotspot_id])
            @travels = Travel.order('created_at').where(hotspot_id: @hotspot.id)
        end
    end

    def new
        @user = User.find(params[:user_id])
        @travel = Travel.new
    end

    def create
        @user = User.find(params[:user_id])
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
        if on_user_path
            @user = User.find(params[:user_id])
            @travel = Travel.find(params[:id]) 
            @comment = Comment.new
        else
            @hotspot = Hotspot.find(@travel.hotspot_id)
            @user = User.find(params[:user_id])
            @comment = Comment.new
        end
    end


    private


    def travel_params
        params.require(:travel).permit(:featured_image,:title,:content,:hotspot_id)
    end

    def on_user_path
        request.original_fullpath.include?("users")
    end
end
