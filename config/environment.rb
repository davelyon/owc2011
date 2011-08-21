# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Owc2011::Application.initialize!

CONFIG = {} unless defined? CONFIG
CONFIG[:twitter_consumer_key] = "X1sZlobxFUduIJwSwY4PA"
CONFIG[:twitter_consumer_secret] = "DYGao1Zn6fWs3Qbq5wRmVERGywiYCeOvcrEnUoRVOQ"
CONFIG[:twitter_oauth_token] = "358979030-DmCPzxsShBsgyVwst9YAmKWXNzXPbXxJWyCaJXXq"
CONFIG[:twitter_oauth_token_secret] = "G6XsBbwmFvtDvWblKs6C1fP2qMmvqjq44SOsCSev4"
