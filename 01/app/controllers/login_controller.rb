module LoginController

  #
  # receive the login post from the browser
  #

  def self.included( base )

    #
    # This method is called when the app/my_app.rb 
    # includes this file
    # 
    # The 'base' argument is MyApp class definition
    #
    # The next bit extends the MyApp class with 
    # this additional functionality.
    # 

    base.class_eval do

      #
      # Receive the posted data from the login form
      # running in the client browser
      #

      post '/login' do

        #
        # We are expecting the browser to send 
        # the login serialised as JSON 
        #

        credentials = JSON.parse( request.body.read )

        #
        # Normally users would be stored in a database
        # 
        # This is pretending.
        # 
        # Return HTTP 200 OK if the username is valid
        # 

        return [200] if credentials['username'] == 'valid'

        #
        # Others get HTTP 401 Unauthorized
        #

        return [401]

      end
      
    end

  end

end
