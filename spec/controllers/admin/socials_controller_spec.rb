require 'spec_helper'

describe Admin::SocialsController do
  before(:each) do
    sign_in_admin_user
  end

  describe "GET #new" do
    it "has a tweet action" do
      message = "tweet message"
      get :new, :message => message

      assigns[:message].should == message
    end
  end

  describe "POST #create" do
    let(:facebook_account) {  mock_model(FacebookAccount) }
    it "returns you to the return_url" do
      Twitter.stub!(:configure)
      Twitter.stub!(:update)
      FacebookAccount.stub(:last).and_return(facebook_account)
      facebook_account.should_receive(:post).once().with("I can has facebook")

      post :create, :post_tweet => {:twitter_post => "I can has tweets!", :facebook_post => "I can has facebook"}

      response.should redirect_to(admin_root_path)
    end

    it "tweets" do
      Twitter.should_receive(:update).with("I can has tweets!")

      post :create, :post_tweet => {:twitter_post => "I can has tweets!"}
    end

    it "deals with twitter's bad attitude" do
      Twitter.should_receive(:update).and_raise("I can has tweets!")

      post :create, :post_tweet => {:twitter_post => "I can has tweets!"}

      response.should render_template("error")
    end

    it "posts to Facebook" do
      FacebookAccount.stub(:last).and_return(facebook_account)
      facebook_account.should_receive(:post).with("I can has facebook")

      post :create, :post_tweet => {:facebook_post => "I can has facebook" }

    end
  end

end
