Access Control Headers
======================

Ever tried to serve custom font files from a cdn or similar? Doesn't work too well in Firefox does it...

This middleware is designed to set the required headers for a cdn to cache, meaning you can leave your nginx conf alone.

Works well on heroku with cloudfront in front.

Install
-------

Add this to your applications Gemfile:

    gem 'rack-access-control-headers'

And run:

    $ bundle

Usage
-----

In config/application.rb (or specific environment file):

    config.middleware.insert_before 'ActionDispatch::Static', 'Rack::AccessControlHeaders', /assets/

Where /assets/ is a regex of the path you want to inject the headers.

N.b. including ahead of ActionDispatch::Static is important if you're running rails.
