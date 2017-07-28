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
        if @setting.save(@info)
            redirect_to user_info_path(current_user) #change me to info_path
        else
            render 'new'
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

    def user_info
        if @user.info.present?
            @user.info
        else
            assign_new_info
        end
    end

    def assign_new_info
        @user.info = Info.new(city: 'nil')
    end

    def setting_params
        params.require(:setting).permit(:info_fb,:info_interests,:info_dob,:info_city)
    end

end
