class PhotosController < ApplicationController
    before_action :set_source,  :authenticate_user!
    before_action :owned_post,only: [:edit,:update,:destroy]
    def index

        @photo = Photo.new
        @photos = Photo.order('created_at').where(user_id: @user.id)


    end

    def show
        @photo = Photo.find(params[:id])
    end

    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.set_user(@user)
        @photo.set_hotspot(@hotspot, current_user)
        if @photo.save
            redirect_to user_path(current_user)
        else
            flash[:notice] = "Your photo could not be saved"
        end
    end

    def edit
        @photo = Photo.find(params[:id])
    end

    def update
        @photo = Photo.find(params[:id])
        @photo.update(photo_params) 
        redirect_to user_photo_path(@user,@photo)
    end

    def destroy
        @photo = Photo.find(params[:id])
        @photo.destroy!
        redirect_to user_path(current_user)
    end



    private

    def set_source
        if params[:user_id]
            @user = User.find(params[:user_id]) 
        else
            @hotspot = Hotspot.find(params[:hotspot_id])
        end
    end

    def photo_params
        params.require(:photo).permit(:pic,:caption)
    end

    def owned_post
        @photo = Photo.find(params[:id])
        unless current_user == @photo.user
            flash[:alert] = "That photo doesnt belong to you"
            redirect_to root_path
        end
    end

    def on_user_path
        if request.original_fullpath.include?("users")
            return true
        end
    end

end
