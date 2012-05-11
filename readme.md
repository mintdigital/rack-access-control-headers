Access Control Headers
======================

Ever tried to serve custom font files from a cdn or similar? Doesn't work too well in Firefox...

This middleware is designed to set the required headers for a cdn to cache.

N.b. Make sure to include ahead of ActionDispatch::Static in rails

E.g:

config.middleware.insert_before 'ActionDispatch::Static', 'Rack::AccessControlHeaders', /assets/

Where /assets/ is the path you want to inject the headers.