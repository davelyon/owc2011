class Admin::SocialsController < AdminController
  def new
    @message = params[:message]
  end

  def create
    Twitter.update(params[:post_tweet][:twitter_post]) if params[:post_tweet][:twitter_post]
    FacebookAccount.last.post(params[:post_tweet][:facebook_post]) if params[:post_tweet][:facebook_post]


    redirect_to admin_root_path
  rescue => e
    logger.debug e
    render "error"
  end
end
