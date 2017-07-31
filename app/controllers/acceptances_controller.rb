class AcceptancesController < ApplicationController
    def create
        friendship.accept!
        redirect_to root_path

    end

    def destroy
        friendship.destroy!
        redirect_to root_path
    end

    private

    def friendship
        Friendship.find(params[:friendship_id])
    end
end
