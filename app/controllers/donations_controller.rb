class DonationsController < ApplicationController

  def index
    @donation_campaigns = DonationCampaign.by_amount
  end
  
  def successful
    if params[:custom]
      ticket = Ticket.find_by_id(params[:custom])
      ticket.update_attributes(:quantity => ticket.quantity - 1) unless ticket.quantity == 0  
      redirect_to successful_donations_path
    end
  end
  
end
