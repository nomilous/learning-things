
#
# To initialize the bundled dependancies
#
require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'] || 'development')
Bundler.require



class MyApp < Sinatra::Base

  get '/' do

    'A web page.'

  end

end
