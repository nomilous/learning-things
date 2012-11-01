#
# Rack config file (this runs the app in the 'rack')
#
# To start: 
# 
# $ rackup config.ru 
# 
# then://http://localhost:9292
# 
# (( OSX? look at http://pow.cx )
#
#  



#
# This arcane looking incantation uses __FILE__ (which refers to
# this file) to assemble a path by relative position to the 
# app/my_app.rb where the app is defined
#

require File.expand_path(File.dirname(__FILE__) + '/app/my_app')



#
# Not that sure what this next bit does
#

run MyApp


#
# Add sprockets middleware to rack
#


map '/assets' do
  run MyApp.settings.sprockets
end

