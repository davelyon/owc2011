require 'spec_helper'

describe Admin::DonationCampaignsController do
  before :each do
    sign_in_admin_user
    @donation_campaign = DonationCampaign.create!(:title => "campaign")
  end

  describe 'index' do
    it "gets all the donation_campaigns" do
      get :index
      assigns(:donation_campaigns).should == [@donation_campaign]
    end
  end

  describe 'show' do
    it "should return a single donation_campaign show page" do
      get :show, :id => @donation_campaign.id
      assigns(:donation_campaign).should == @donation_campaign
    end
  end

  describe 'new' do
    it "returns a new donation_campaign record" do
      get :new
      assigns(:donation_campaign).is_a?(DonationCampaign).should be_true
      assigns(:donation_campaign).new_record?.should be_true
    end
  end

  describe 'edit' do
    it "gets the donation_campaign to be edited" do
      get :edit, :id => @donation_campaign.id
      assigns(:donation_campaign).should == @donation_campaign
    end
  end

  describe "create" do
    it "creates a new donation_campaign" do
      post :create, :donation_campaign => {:title => "new donation_campaign"}
      assigns(:donation_campaign).title.should == "new donation_campaign"
    end

    it "redirects to the show page for the donation_campaign" do
      post :create, :donation_campaign => {:title => "new title"}
      response.should redirect_to [:admin, assigns(:donation_campaign)]
    end
  end

  describe 'update' do
    it "should update a donation_campaign" do
      get :update, :id => @donation_campaign.id, :donation_campaign => {:title => "new title"}
      @donation_campaign.reload
      @donation_campaign.title.should == "new title"
    end

    it "redirects to the show page for the donation_campaign" do
      get :update, :id => @donation_campaign.id, :donation_campaign => {:title => "new title"}
      response.should redirect_to [:admin, assigns(:donation_campaign)]
    end
  end

  describe 'destroy' do
    it "destroys the story" do
      delete :destroy, :id => @donation_campaign.id
      lambda { DonationCampaign.find(@donation_campaign.id) }.should raise_error ActiveRecord::RecordNotFound
      response.should redirect_to [:admin, :donation_campaigns]
    end
  end
end
