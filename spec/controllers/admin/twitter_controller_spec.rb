require 'spec_helper'

describe Admin::TwitterController do
  context "tweet" do
    it "has a tweet action" do
      message = "tweet message"
      get :tweet, :message => message
      
      assigns[:message].should == message
    end
    
    it "returns you to the return_url" do
      Twitter.stub!(:configure)
      Twitter.stub!(:update)
      
      post :post_tweet
      
      response.should redirect_to(admin_path)
    end
    
    it "tweets" do
      configure = mock("Configurer")
      configure.should_receive(:consumer_key=).with("ABC")
      configure.should_receive(:consumer_secret=).with("ABC")
      configure.should_receive(:oauth_token=).with("ABC")
      configure.should_receive(:oauth_token_secret=).with("ABC")
      Twitter.should_receive(:configure).once.and_yield(configure)
      Twitter.should_receive(:update).with("I'm tweeting with @gem!")
      
      post :post_tweet
    end
    
    it "deals with twitter's bad attitude" do
      Twitter.should_receive(:update).and_raise("I'm twitter and I stink!")
      
      post :post_tweet
      
      response.should render_template("error")
    end
  end

end
