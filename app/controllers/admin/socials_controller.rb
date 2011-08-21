class Admin::SocialsController < AdminController
  def new
    @message = params[:message]
  end

  def create
    Twitter.configure do |config|
      config.consumer_key = CONFIG[:twitter_consumer_key]
      config.consumer_secret =  CONFIG[:twitter_consumer_secret]

      config.oauth_token =  CONFIG[:twitter_oauth_token]
      config.oauth_token_secret =  CONFIG[:twitter_oauth_token_secret]
    end

    Twitter.update(params[:post_tweet][:twitter_post]) if params[:post_tweet][:twitter_post]
    FacebookAccount.last.post(params[:post_tweet][:facebook_post]) if params[:post_tweet][:facebook_post]


    redirect_to admin_root_path
  rescue => e
    render "error"
  end
end
