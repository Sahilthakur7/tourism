class FriendshipsController < ApplicationController
    def new
        @user = User.find(params[:user_id]) 
    end

    def create
        @user = User.find(params[:user_id])
        @friendship = Friendship.new
        @friendship.friend1_id = current_user.id
        @friendship.friend2_id = @user.id
        if @friendship.save
            flash[:notice] = "Your request is pending confirmation"
            redirect_to root_path
        else
            flash[:notice] = "Your request could not be sent"
            redirect_to root_path

        end

    end
end
