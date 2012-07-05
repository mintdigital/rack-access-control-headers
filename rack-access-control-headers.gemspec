Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Pomfret"]
  gem.email         = ['thomas@mintdigital.com']
  gem.description   = %q{Set access control headers for FF}
  gem.summary       = %q{Sends headers to allow FF to show font files cross-domain}
  gem.homepage      = "http://github.com/mintdigital/rack-access-control-headers"

  gem.files         = ['lib/rack-access-control-headers.rb', 'lib/rack/access-control-headers.rb']
  gem.name          = "rack-access-control-headers"
  gem.version       = '0.0.3'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack'
end
