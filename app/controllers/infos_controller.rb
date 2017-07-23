class InfosController < ApplicationController
    before_action :set_user, :set_info

    def show
        
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_info
        @info = @user.info
    end
end
