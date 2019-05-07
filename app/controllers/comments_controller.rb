class CommentsController < ApplicationController
  before_action :require_user, only: [:create, :edit]
  before_action :set_ticket, only: [:create, :edit, :update]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def create
    @comment = @ticket.comments.build(comment_params)
    @comment.creator = current_user

    if @comment.save
      flash[:success] = "Your comment was added."
      redirect_to ticket_path(@ticket)
    else
      render 'tickets/show'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Your comment was updated."
      redirect_to ticket_path(@ticket)
    else

    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_comment
    @comment = @ticket.comments.find(params[:id])
  end

  def require_same_user
    if current_user != @comment.creator
      flash[:notice] = "You can only edit your own comments"
      redirect_to ticket_path(@ticket)
    end
  end
end