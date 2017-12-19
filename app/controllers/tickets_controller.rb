class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

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
    @ticket = Ticket.find(params[:id])
  end

  def index

  end

  def destroy
    Ticket.find(params[:id]).destroy
    redirect_to tickets_path

  end

  private

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status_id, tag_ids: [])
  end

end
