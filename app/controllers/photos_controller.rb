class PhotosController < ApplicationController
    before_action :set_user
    def index
        @photo = Photo.new
        @photos = Photo.order('created_at').where(user_id: @user.id)

    end

    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
            @photo.set_user(@user)
        if @photo.save
            redirect_to user_photos_path(current_user)
        else
            flash[:notice] = "Your photo could not be saved"
        end
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def photo_params
        params.require(:photo).permit(:pic,:caption)
    end
end
