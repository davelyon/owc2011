require 'spec_helper'

describe DonationCampaign do
  
  it "finds in order of expense" do
    DonationCampaign.destroy_all
    moderate = DonationCampaign.create!(:title => "expensive", :amount => 10)
    cheap = DonationCampaign.create!(:title => "expensive", :amount => 1)
    expensive = DonationCampaign.create!(:title => "expensive", :amount => 1000)
    
    DonationCampaign.by_amount.should == [expensive, moderate, cheap]
  end
end
