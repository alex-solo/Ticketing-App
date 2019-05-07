class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]

  def index
    @tickets = Ticket.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params.merge(creator: current_user))

    if @ticket.save
      flash[:notice] = "A new ticket was created."
      redirect_to ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket was updated."
      redirect_to ticket_path(@ticket)
    else
      render :edit
    end 
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "You have deleted the #{@ticket.name} ticket."
    redirect_back fallback_location: root_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, :assignee_id, tag_ids: [])
  end
end
