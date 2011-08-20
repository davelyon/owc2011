require 'spec_helper'

describe LandingController do

  it "has donations" do
    donation = mock(Donation)
    Donation.should_receive(:all).and_return([donation])

    get :index
    assigns[:donations].should == [donation]
  end
end
