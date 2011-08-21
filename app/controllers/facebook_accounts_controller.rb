class FacebookAccountsController < ApplicationController
  def new
    facebook_account = FacebookAccount.create()
    redirect_to(facebook_account.authorize_url(facebook_callback_url(:id => facebook_account.id)))
  end

  def callback
    if params[:error_reason] && !params[:error_reason].empty?
      redirect_to(:root, :notice => "Unable to activate facebook: #{params[:error_reason]}")
    elsif params[:code] && !params[:code].empty?
      facebook_account = FacebookAccount.find(params[:id])
      facebook_account.validate_oauth_token(params[:code], facebook_callback_url(:id => facebook_account.id))
      redirect_to facebook_pages_path(params[:id])
    end
  end

  def pages
    @account = FacebookAccount.find(params[:id])
    @pages = @account.get_pages
    render :template => "facebook_accounts/pages"
  end

  def assign_page
    @account = FacebookAccount.find(params[:id])
    @account.assign_page(params[:page_id], params[:token])
    redirect_to(:root, :notice => 'Facebook page... selected!')
  end
end
