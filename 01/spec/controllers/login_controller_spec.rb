describe LoginController do

  it 'authenticates a valid login' do

    post '/login', { 

      username: 'valid', 
      password: '' 

    }.to_json

    last_response.status.should == 200

  end

  it 'denies an invalid login' do

    post '/login', { 

      username: 'invalid', 
      password: '' 

    }.to_json

    last_response.status.should == 401

  end

end
