class FacebookAccount < ActiveRecord::Base

  CLIENT_ID = '267176299960566'
  CLIENT_SECRET = 'b365841b9c47e527efd909e212c5f553'

  def authorize_url(callback_url = '')
    if self.oauth_authorize_url.blank?
      self.oauth_authorize_url = "https://graph.facebook.com/oauth/authorize?client_id=#{CLIENT_ID}&redirect_uri=#{callback_url}&scope=offline_access,publish_stream"
      self.save!
    end
    self.oauth_authorize_url
  end

  def validate_oauth_token(oauth_verifier, callback_url = '')
    response = RestClient.get("https://graph.facebook.com/oauth/access_token?client_id=#{CLIENT_ID}&redirect_uri=#{callback_url.html_safe}&client_secret=#{FACEBOOK_CLIENT_SECRET}&code=#{oauth_verifier.html_safe}")
    pair = response.body.split("&")[0].split("=")
    if (pair[0] == "access_token")
      self.access_token = pair[1]
      response = RestClient.get 'https://graph.facebook.com/me', :params => { :access_token => self.access_token }
      self.stream_url = JSON.parse(response.body)["link"]
      self.active = true
    else
      self.errors.add(:oauth_verifier, "Invalid token, unable to connect to facebook: #{pair[1]}")
      self.active = false
    end
    self.save!
  end

  def post(message)
    RestClient.post 'https://graph.facebook.com/me/feed', { :access_token => self.access_token, :message => message }
  end

end

