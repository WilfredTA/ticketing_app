class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:body, :ticket_id))
    @comment.creator = current_user

    if @comment.save
      ticket = @comment.ticket
      redirect_to ticket_path(ticket)
    else

    end
  end

  def edit

  end

  def update

  end

end
