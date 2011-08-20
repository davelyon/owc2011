require 'spec_helper'

describe Admin::TwitterController do
  context "tweet" do
    it "has a tweet action" do
      return_url = "admin/fundraiser"
      message = "tweet message"
      get :tweet, :message => message, :return_url => return_url
      
      assigns[:message].should == message
      assigns[:return_url].should == return_url
    end
    
    it "returns you to the return_url" do
      Twitter.stub!(:configure)
      Twitter.stub!(:update)
      
      post :post_tweet, :return_url => "admin/index"
      
      response.should redirect_to("admin/index")
    end
    
    it "tweets" do
      configure = mock("Configurer")
      configure.should_receive(:consumer_key=).with("ABC")
      configure.should_receive(:consumer_secret=).with("ABC")
      configure.should_receive(:oauth_token=).with("ABC")
      configure.should_receive(:oauth_token_secret=).with("ABC")
      Twitter.should_receive(:configure).once.and_yield(configure)
      Twitter.should_receive(:update).with("I'm tweeting with @gem!")
      
      post :post_tweet, :return_url => "admin/index"
    end
  end

end
