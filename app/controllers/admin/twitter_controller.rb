class Admin::TwitterController < ApplicationController
  def tweet
    @message = params[:message]
  end
  
  def post_tweet
    Twitter.configure do |config|
      config.consumer_key = CONFIG[:twitter_consumer_key]
      config.consumer_secret =  CONFIG[:twitter_consumer_secret]

      config.oauth_token =  CONFIG[:twitter_oauth_token]
      config.oauth_token_secret =  CONFIG[:twitter_oauth_token_secret]
    end
    
    Twitter.update(params[:post_tweet][:twitter_post])
    
    redirect_to admin_path
  rescue => e
    render "error"    
  end
end
