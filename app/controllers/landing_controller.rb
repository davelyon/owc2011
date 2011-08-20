class LandingController < ApplicationController
  
  def index
    @donations = DonationCampaign.all
  end
end
