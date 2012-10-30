require 'my_app'  # calls to app/my_app.rb


#
# Get rack up in test mode
#

ENV['RACK_ENV'] = 'test'
require 'rack/test'
require 'json'


#
# Config RSpec with the Rack test extensions
#

RSpec.configure do |config|
  config.include Rack::Test::Methods
end


#
# The test environment calls app()
# to start the app
#
# It is up to us to define app()
# 

def app
  MyApp.new
end


