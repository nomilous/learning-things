
#
# To initialize the bundled dependancies
#
require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'] || 'development')
Bundler.require



class MyApp < Sinatra::Base

  get '/' do

    'text gets sent to browser'

  end

end
