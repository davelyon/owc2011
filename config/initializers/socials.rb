Twitter.configure do |config|
  config.consumer_key = CONFIG[:twitter_consumer_key]
  config.consumer_secret =  CONFIG[:twitter_consumer_secret]

  config.oauth_token =  CONFIG[:twitter_oauth_token]
  config.oauth_token_secret =  CONFIG[:twitter_oauth_token_secret]
end
