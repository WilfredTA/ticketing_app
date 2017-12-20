class TicketsController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user
    if @ticket.save
      flash[:success] = "New ticket has been created"
      redirect_to tickets_path
    else
      render 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      flash[:notice] = "ticket successfully updated"
      redirect_to ticket_path(@ticket)
    else
      render 'edit'
    end
  end

  def show

    @comment = Comment.new
    @ticket = Ticket.find(params[:id])
  end

  def index
    if params[:project]
      @tickets = Ticket.where('project_id=?', [params[:project]])
    elsif params[:tag]
      @tickets = Ticket.joins(:tags).where('tags.id=?', params[:tag])
    else
      @tickets = Ticket.all
    end
  end

  def destroy
    Ticket.find(params[:id]).destroy
    redirect_to tickets_path

  end

  private

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status_id, :assignee_id, tag_ids: [])
  end

end
