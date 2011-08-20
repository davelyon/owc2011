class Admin::TwitterController < ApplicationController
  def tweet
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
    
    redirect_to admin_path
  rescue => e
    render "error"
  end
end
