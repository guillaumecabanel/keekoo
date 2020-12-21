class CommentsController < ApplicationController
  def create
    @moment         = current_user.moments.find(params[:moment_id])
    @comment        = Comment.new(comment_params)
    @comment.moment = @moment
    @comment.user   = current_user

    if @comment.save
      redirect_to tribe_moment_path(@moment.tribe, @moment)
    else
      respond_to do |format|
        format.html { broadcast_errors @comment, comment_params }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
