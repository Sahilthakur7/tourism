class HeartsController < ApplicationController
    respond_to :js

    def heart
        @user = current_user
        @post = Photo.find(params[:photo_id])
        @user.heart!
    end

    def unheart
        @user = current_user
        @heart = @user.hearts.find_by_photo_id(params[:photo_id])
        @photo = Photo.find(params[:photo_id])
        @photo.destroy!
    end
end
