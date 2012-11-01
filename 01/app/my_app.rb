#
# ensure the load path
#
unless $LOAD_PATH.include? "."
  $LOAD_PATH.unshift File.expand_path('..', File.dirname(__FILE__))
end


#
# To initialize the bundled dependancies
#
require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'] || 'development')
Bundler.require

require 'json'

Dir["app/controllers/*.rb"].each {|file| require file }

class MyApp < Sinatra::Base

  #
  # config sprockets
  #
  set :root, File.expand_path(File.dirname(__FILE__))
  set :assets_prefix, 'assets'
  set :sprockets, Sprockets::Environment.new(assets_prefix)

  #
  # precompile whichever asses are in applicaiton.js and application.css
  #
  set :precompile, [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ]

  configure do
    sprockets.append_path(File.join(root, assets_prefix, 'stylesheets'))
    sprockets.append_path(File.join(root, assets_prefix, 'javascripts'))
  end
  

  get '/' do
    "A web page."
  end

  include LoginController

end
