class LandingController < ApplicationController
  
  def index
    @donations = Donation.all
  end
end
