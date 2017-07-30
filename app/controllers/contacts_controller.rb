class ContactsController < ApplicationController
    def show
        @user = User.find(params[:user_id])
        @friend_requests = Friendship.where(:friend2_id => @user.id).where(confirmed: nil)
    end
end
