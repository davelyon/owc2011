# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Owc2011::Application.initialize!

CONFIG = {} unless defined? CONFIG
CONFIG[:twitter_account] = "kidshavehopetes"
CONFIG[:twitter_password] = "havehope"
