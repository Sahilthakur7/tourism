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



    private

    def set_user
        @user = User.find(params[:id])
    end
end
