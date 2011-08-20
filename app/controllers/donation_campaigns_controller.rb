class DonationCampaignsController < ApplicationController

  def index
    @donation_campaigns = DonationCampaign.all
  end

  def show
    @donation_campaign = DonationCampaign.find(params[:id])
    render template: "admin/donation_campaigns/show"
  end

end
