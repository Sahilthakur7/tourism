class FriendsController < ApplicationController
    before_action :set_friends
    def show
        
    end

    private

    def set_friends
        @user = User.find(params[:user_id]) 
        @friendships = Friendship.where("friend1_id = ? OR friend2_id = ?", @user.id,@user.id).where(confirmed: true)
    end
end
