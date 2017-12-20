class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:body, :ticket_id))
    @comment.creator = current_user

    if @comment.save
      if params[:ticket_status]
        @comment.ticket.status_id = params[:ticket_status]
        @comment.ticket.save
      end
      ticket = @comment.ticket
      redirect_to ticket_path(ticket)
    else
      render ticket_path(ticket)
    end
  end

  def edit

  end

  def update

  end

end
