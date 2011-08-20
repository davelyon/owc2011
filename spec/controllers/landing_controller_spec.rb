require 'spec_helper'

describe LandingController do

  it "has donations" do
    donation = mock(DonationCampaign)
    DonationCampaign.should_receive(:all).and_return([donation])

    get :index
    assigns[:donation_campaigns].should == [donation]
  end
end
