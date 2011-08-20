require 'spec_helper'

describe LandingController do

  it "has donations" do
    donation = mock(DonationCampaign)
    DonationCampaign.should_receive(:all).and_return([donation])

    get :index
    assigns[:donations].should == [donation]
  end
end
