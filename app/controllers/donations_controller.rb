class DonationsController < ApplicationController

  def index
    @donation_campaigns = DonationCampaign.by_amount
  end

end
