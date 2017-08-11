class UsersController < ApplicationController
    before_action :set_user, only: [:show,:edit]
    def show
            
    end

    def index
        if params[:search]
            @users = User.search(params[:search])
        else
            @users = User.all
        end

    end

    def rate
        @user = User.find(params[:id])
        @num = params[:num].to_i
        if @user.stars
        @user.stars += @num
        else
            @user.stars = 0
            @user.stars += @num
        end
        @user.save
        redirect_to @user
    end




    private

    def set_user
        @user = User.find(params[:id])
    end
end
