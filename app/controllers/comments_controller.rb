class CommentsController < ApplicationController
    def show

    end

    def create
        if request.original_fullpath.include?("photos")
            @photo = Photo.find(params[:photo_id])
            @comment = @photo.comments.build(comment_params)
        else
            @travel = Travel.find(params[:travel_id])
            @comment = @travel.comments.build(comment_params)
        end
        @comment.user_id = current_user.id

        if @comment.save
            flash[:success] = "You commented the hell out of that post!"
            redirect_to :back
        else
            flash[:alert]="Could not comment"
            render root_path
        end
    end

    def destroy
        @comment = @photo.comments.find(params[:id])

        @comment.destroy
        flash[:succes] = "COmment deleted."
        redirect_to root_path
    end

    def new

    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_photo
        @photo = Photo.find(params[:photo_id])
    end

end
