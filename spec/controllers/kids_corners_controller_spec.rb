require 'spec_helper'

describe KidsCornersController do

  it "has kids_corners" do
    corner = mock(KidsCorner)
    KidsCorner.should_receive(:all).and_return([corner])

    get :index
    assigns[:kids_corners].should == [corner]
  end

  it "has kids_corners" do
    corner = mock(KidsCorner)
    KidsCorner.should_receive(:all).and_return([corner])

    get :index
    assigns[:kids_corners].should == [corner]
  end

  context "show" do
    let(:corner) { KidsCorner.create!(:title => "Name", :content => "Lorem Ipsum") }
    it "loads the kids_corner" do
      get :show, :id => corner.id
      assigns[:kids_corner].should == corner
    end
  end
end
