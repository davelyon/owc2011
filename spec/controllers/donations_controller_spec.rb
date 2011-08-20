require 'spec_helper'

describe DonationsController do
  before :each do
    @donation = Donation.create!(:title => "campaign")
  end

  describe 'index' do
    it "gets all the donations" do
      get :index
      assigns(:donations).should == [@donation]
    end
  end

  describe 'show' do
    it "should return a single donation show page" do
      get :show, :id => @donation.id
      assigns(:donation).should == @donation
    end
  end

  describe 'new' do
    it "returns a new donation record" do
      get :new
      assigns(:donation).is_a?(Donation).should be_true
      assigns(:donation).new_record?.should be_true
    end
  end

  describe 'edit' do
    it "gets the donation to be edited" do
      get :edit, :id => @donation.id
      assigns(:donation).should == @donation
    end
  end

  describe "create" do
    it "creates a new donation" do
      post :create, :donation => {:title => "new donation"}
      assigns(:donation).title.should == "new donation"
    end

    it "redirects to the show page for the donation" do
      post :create, :donation => {:title => "new title"}
      response.should redirect_to assigns(:donation)
    end
  end

  describe 'update' do
    it "should update a donation" do
      get :update, :id => @donation.id, :donation => {:title => "new title"}
      @donation.reload
      @donation.title.should == "new title"
    end

    it "redirects to the show page for the donation" do
      get :update, :id => @donation.id, :donation => {:title => "new title"}
      response.should redirect_to @donation
    end
  end

  describe 'destroy' do
    it "destroys the story" do
      delete :destroy, :id => @donation.id
      lambda { Donation.find(@donation.id) }.should raise_error ActiveRecord::RecordNotFound
      response.should redirect_to donations_path
    end
  end
end
