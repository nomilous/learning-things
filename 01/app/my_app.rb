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

  configure :development, :test do
    require 'rack-livereload'
    use Rack::LiveReload
    register Sinatra::Reloader
  end

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


  #
  # run clientside tests from /tests
  #

  

  configure :development, :test do

    set :spec_root, File.expand_path('../spec', File.dirname(__FILE__))
    sprockets.append_path(File.join(spec_root, assets_prefix, "javascripts"))

    get '/tests' do
      erb File.open(settings.spec_root + '/assets/javascripts/spec-runner.erb'
       ).read 
    end

  end

end
