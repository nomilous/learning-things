### Make a webapp with:

* [Ruby](http://www.ruby-lang.org/en/) - because it's awesome! (And [this helps](https://rvm.io/) if you need multiple versions)
* [Bundler](http://gembundler.com/) - to manage the application dependancies (gems)
* [Sinatra](https://github.com/sinatra/sinatra) - because they did it their way, and it was good. 
* [Rack](https://github.com/rack/rack) - to enable sprockets (and because of [THIS!](http://pow.cx/) and [THIS!](http://xip.io/))
* [Sprockets](https://github.com/sstephenson/sprockets) - because it has: "...a powerful preprocessor pipeline that allows you to write assets in languages like CoffeeScript..." 
* [CoffeeScript](http://coffeescript.org/) - because it's beautiful

...allmost forgot:

* [RSpec](http://en.wikipedia.org/wiki/Test-driven_development) - because [Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development) is the new [Hyperspace](https://github.com/nomilous/we-rspec/tree/master/.metadata), only better.

### First


I'm running ruby1.9.3, [here's how](https://github.com/nomilous/learning-things/commit/8f3b71a55a5ccaaef670816e3b5db18b1866bc59)

### Bundler

* Just added the Gemfile and put a note to usage in it. It's up there somewhere in the file viewer.

### RSpec

* RSpec tests your code. 
* And RSpec is also code itself. 
* But its code that is clever enough to put itself into your code. (approximately)
* And then it waits there. (approximately)
* Watching. (approximately)
* To make sure that your code does what you told RSpec `it "should" do` 

eg.

<pre>  

describe MyApp do

    it 'should work' do
        MyApp.works.should == true
    end

end

</pre>

### [Guard](https://github.com/guard/guard) is very very cool.

* You can jump up and down in front of it and make faces, and everything, [and yet it remains resolute](http://en.wikipedia.org/wiki/File:Buckingham-palace-guard-11279634947G5ru.jpg)
* It also has a bunch of plugins

This [commit](https://github.com/nomilous/learning-things/commit/6fe5e409498021419dd2b2984279513a48797d00) outlines everything necessary to make the following possible: ---

### The continuous running of tests

<pre>

$ guard
00:13:14 - INFO - Guard uses TerminalTitle to send notifications.
00:13:14 - INFO - Guard::RSpec is running

[1] guard(main)> # hits enter to run all tests
=> nil

[2] guard(main)> "or not..."
=> "or not..."

[3] guard(main)> "or not".length
=> 6

[4] guard(main)> 
00:13:44 - INFO - Run all
00:13:44 - INFO - Running all specs

MyApp
  should work (FAILED - 1)

Failures:

  1) MyApp should work
     Failure/Error: MyApp.works.should == true
       expected: true
            got: false (using ==)
     # ./spec/my_app_spec.rb:5:in `block (2 levels) in <top (required)>'

Finished in 0.00101 seconds
1 example, 1 failure

Failed examples:

rspec ./spec/my_app_spec.rb:3 # MyApp should work

[5] guard(main)> 

#
# now its waiting for you to change a watched file
# files are watched per the regex in the Guardfile
#

</pre>


### Rack and Sinatra

This [commit](https://github.com/nomilous/learning-things/commit/ccc0630b82340c49e3f1dfd6da9bc9c381903add) shows all the changes necessary to get rack and sinatra to serve a web page.

New gems were added to the Gemfile, so it was necessary to run bundle before starting the app, as follows:

<pre>

$ bundle
Using rake (0.9.2.2) 
Using coderay (1.0.8) 
Using diff-lcs (1.1.3) 
...
Using bundler (1.2.1) 
Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.

$ rackup config.ru 
[2012-10-30 20:49:38] INFO  WEBrick 1.3.1
[2012-10-30 20:49:38] INFO  ruby 1.9.3 (2012-04-20) [x86_64-darwin11.3.0]
[2012-10-30 20:49:38] INFO  WEBrick::HTTPServer#start: pid=2717 port=9292

</pre>

And, with that, the app is running at [http://localhost:9292](http://localhost:9292)


### Testing a webapp (serverside)

* Add the sinatra-contrib gem, which included rack/test
* Set up the spec/spec_helper to start the app up in test mode
* This [commit](https://github.com/nomilous/learning-things/commit/5cbe6ac63041a4edc81d36592f1985cd9341983d) outlines all the changes to make the following test work

<pre>
describe 'MyApp' do

  it 'should serve a webpage' do

    get "/"
    last_response.status.should eql 200
    last_response.body.should == "A web page."

  end
  
end
</pre>


### A login controller

* Added `app/controllers/login_controller.rb` to manage the serverside login functionality
* Included the login_controller into `app/app_app.rb
* This [commit](https://github.com/nomilous/learning-things/commit/b21376b37d27c5cb9e23c9be57806d177f6f84de) outlines all the changes for the login
* All the while guard has been re-running tests with every change

<pre>
[1] guard(main)> 
22:16:36 - INFO - Run all
22:16:36 - INFO - Running all specs

LoginController
  authenticates a valid login
  denies an invalid login

MyApp
  should serve a webpage

Finished in 0.04353 seconds
3 examples, 0 failures

[1] guard(main)> 
</pre>


### Sprockets to provide assets to the browser

* Gemfile now has spockets, sass, and coffeescript
* Added app/assets with javascripts and stylesheets directories
* Configured sprockets to precompile from the script manifests `applicaiton.js` and `application.css`
* This [commit](https://github.com/nomilous/learning-things/commit/1fdf1660671ceae747b7a8a4e06329e10cfa64a3) outlines all the changes





