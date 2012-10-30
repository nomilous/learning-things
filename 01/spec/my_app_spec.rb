describe 'MyApp' do

  it 'should serve a webpage' do

    get "/"
    last_response.status.should eql 200
    last_response.body.should == "A web page."

  end
  
end
