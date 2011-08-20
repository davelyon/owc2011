class Admin::TicketsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :load_fundraiser
  
  def index
    @tickets = @fundraiser.tickets
  end

  
  def new
    @ticket = @fundraiser.tickets.new
  end
  
  def create
    @ticket = @fundraiser.tickets.create!(params[:ticket])
    if @ticket.save
      redirect_to admin_fundraiser_tickets_path, :notice => "Ticket Added!"
    else
      render :new
    end
  end
  
  def edit
    @ticket = Ticket.find(params[:id])
    render :new
  end
  
  def update
    @ticket = Ticket.find_by_id(params[:id])
    if @ticket.update_attributes(params[:ticket])
      redirect_to admin_fundraiser_tickets_path, :notice => "Ticket Updated!"
    else
      render :new
    end
  end
  
  def destroy
    @ticket = Ticket.find_by_id(params[:id])
    @ticket.destroy
    redirect_to admin_fundraiser_tickets_path
  end
  
  def show
    @ticket = Ticket.find_by_id(params[:id])
  end
  
  
  private ################
  
  
  def load_fundraiser
    @fundraiser = Fundraiser.find_by_id(params[:fundraiser_id])
  end
  
end
