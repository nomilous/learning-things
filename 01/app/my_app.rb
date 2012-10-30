
#
# To initialize the bundled dependancies
#
require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'] || 'development')
Bundler.require

require 'json'
require 'controllers/login_controller'

class MyApp < Sinatra::Base

  get '/' do
    'A web page.'
  end

  include LoginController

end
