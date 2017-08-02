class FriendsController < ApplicationController
    before_action :set_friends
    before_filter :authenticate_user!
    before_action :confirm_user
    def show
        
    end
    
    def index
        if params[:search]
            @user_found = User.search(params[:search]).first 
            @friendships = Friendship.where("friend1_id = ? OR friend2_id = ?", @user_found.id,@user_found.id).where(confirmed: true)
        else

        @friendships = Friendship.where("friend1_id = ? OR friend2_id = ?", @user.id,@user.id).where(confirmed: true)
        end

    end

    private

    def set_friends
        @user = User.find(params[:user_id]) 
    end

    def confirm_user
        if current_user != @user
            flash[:notice] = "Can't see other user's friends."
            redirect_to root_path
        end
    end
end
