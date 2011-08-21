require "spec_helper"

describe DonationsController do
  
  it "decriments a donation campaign" do
    fund = Fundraiser.create!(:name => "fund")
    ticket = fund.tickets.create!(:title => "title", :quantity => 4)

    get :successful, :custom => ticket.id

    ticket.reload
    ticket.quantity.should == 3
  end
end