
# 
# this adds the app folder to the load path
# so the tests can find the my_app.rb file 
# to run it
# 
$LOAD_PATH.unshift 'app'

#
# this tells rspec to please run the spec_helper
# before each test run
#
RSpec.configure do |config|

  

end
