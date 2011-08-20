class LandingController < ApplicationController
  def index
    @donation_campaigns = DonationCampaign.all
  end
end
