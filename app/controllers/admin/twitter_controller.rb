class Admin::TwitterController < ApplicationController
  def tweet
    @return_url = params[:return_url]
    @message = params[:message]
  end
  
  def post_tweet
    Twitter.configure do |config|
      config.consumer_key = "ABC"
      config.consumer_secret =  "ABC"
      config.oauth_token =  "ABC"
      config.oauth_token_secret =  "ABC"
    end
    
    Twitter.update("I'm tweeting with @gem!")
    
    
    redirect_to params[:return_url]
  end
end
