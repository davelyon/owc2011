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
      
      post :post_tweet, :post_tweet => {:twitter_post => "I can has tweets!"}
      
      response.should redirect_to(admin_root_path)
    end
    
    it "tweets" do
      configure = mock("Configurer")
      configure.should_receive(:consumer_key=).with(CONFIG[:twitter_consumer_key])
      configure.should_receive(:consumer_secret=).with(CONFIG[:twitter_consumer_secret])
      configure.should_receive(:oauth_token=).with(CONFIG[:twitter_oauth_token])
      configure.should_receive(:oauth_token_secret=).with(CONFIG[:twitter_oauth_token_secret])
      Twitter.should_receive(:configure).once.and_yield(configure)

      Twitter.should_receive(:update).with("I can has tweets!")
      
      post :post_tweet, :post_tweet => {:twitter_post => "I can has tweets!"}
    end
    
    it "deals with twitter's bad attitude" do
      Twitter.should_receive(:update).and_raise("I can has tweets!")
      
      post :post_tweet, :post_tweet => {:twitter_post => "I can has tweets!"}
      
      response.should render_template("error")
    end
  end

end
