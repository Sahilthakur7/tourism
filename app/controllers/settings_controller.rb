class SettingsController < ApplicationController
    before_action :set_user, :set_info
    def show
        @setting = Setting.new    
    end

    def new
        @setting = Setting.new
    end

    def create
        @setting = Setting.new(setting_params)
        if @setting.save
            redirect_to root_path #change me to info_path
        else
            render 'show'
        end

    end

    private

    def set_user
        @user = User.find(params[:user_id])

    end

    def set_info
        @user = User.find(params[:user_id])
        @info = user_info  
    end

    def create_user_info
        @inf = Info.new
        relate_info
    end

    def relate_info
        @user.info = @inf
        return @user.info
    end

    def user_info
        @user.info || create_user_info
    end

    def setting_params
        params.require(:setting).permit(:info_fb,:info_interests,:info_dob,:info_city)
    end

end
