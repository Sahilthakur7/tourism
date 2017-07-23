class InfosController < ApplicationController
    before_action :set_user, :set_info
    before_action :check_if_present, only: [:show]

    def show
        
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_info
        @info = @user.info || Noinfo.new
    end

    def check_if_present
        @info.if_absent { redirect_to new_user_settings_path(current_user)}
    end
end
