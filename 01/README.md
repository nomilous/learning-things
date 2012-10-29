### Make a webapp with:

* [Ruby](http://www.ruby-lang.org/en/) - because it's awesome! (And [this helps](https://rvm.io/) if you need multiple versions)
* [Bundler](http://gembundler.com/) - to manage the application dependancies (gems)
* [Sinatra](https://github.com/sinatra/sinatra) - because they did it their way, and it was good. 
* [Rack](https://github.com/rack/rack) - to enable sprockets (and because of [THIS!](http://pow.cx/) and [THIS!](http://xip.io/))
* [Sprockets](https://github.com/sstephenson/sprockets) - because it has: "...a powerful preprocessor pipeline that allows you to write assets in languages like CoffeeScript..." 
* [CoffeeScript](http://coffeescript.org/) - because it's beautiful

...allmost forgot:

* [RSpec](http://en.wikipedia.org/wiki/Test-driven_development) - because [Test Driven Development](http://en.wikipedia.org/wiki/Test-driven_development) is the new [Hyperspace](https://github.com/nomilous/we-rspec/tree/master/.metadata), only better.

First
-----

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
* At also has a bunch of plugins

This [commit]() outlines everything necessary to make this ---

<pre>

          01/• guard
00:10:20 - INFO - Guard uses TerminalTitle to send notifications.
00:10:20 - INFO - Guard::RSpec is running
[1] guard(main)> # hits enter to run all tests
=> nil
[2] guard(main)> or not
SyntaxError: unexpected keyword_or, expecting $end
or not
  ^
[2] guard(main)> 
00:10:43 - INFO - Run all
00:10:43 - INFO - Running all specs

MyApp
  should work (FAILED - 1)

Failures:

  1) MyApp should work
     Failure/Error: MyApp.works.should == true
       expected: true
            got: false (using ==)
     # ./spec/my_app_spec.rb:5:in `block (2 levels) in <top (required)>'

Finished in 0.00097 seconds
1 example, 1 failure

Failed examples:

rspec ./spec/my_app_spec.rb:3 # MyApp should work

[3] guard(main)> 

</pre>

--- work.