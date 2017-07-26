class CommentsController < ApplicationController
    before_action :set_post
    def show

    end

    def create
        @comment = @post.comments.build(comment_params)
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
        @comment = @post.comments.find(params[:id])

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

    def set_post
        @post = Post.find(params[:post_id])
    end

end
