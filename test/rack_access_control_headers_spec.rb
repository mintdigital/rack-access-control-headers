require 'rspec'
require 'rack-access-control-headers'
require 'rack/mock'

describe Rack::AccessControlHeaders do
  before { @app = lambda {|env| [200, {'Content-Type' => 'text/plain'}, ['Hello']] }}
  describe 'New' do
    it 'should take path arg' do
      lambda { Rack::AccessControlHeaders.new(@app, /assets/)}.should_not raise_error(ArgumentError) 
    end

    it 'should take origin' do
      lambda { Rack::AccessControlHeaders.new(@app, /assets/, 'http://test.com')}.should_not 
        raise_error(ArgumentError) 
    end
  end

  describe 'Call' do
    it 'should return middleware' do
      Rack::AccessControlHeaders.new(@app, /assets/).should respond_to(:call)
    end

    it 'should set access control header' do
      status, headers, body = Rack::AccessControlHeaders.new(@app, /assets/).call(Rack::MockRequest.env_for("/assets/test.gif"))
      headers["Cache-Control"].should match("public")
      headers["Access-Control-Allow-Origin"].should match(/\*/)
      headers["Expires"].should match("#{(Time.now + (60*60*24*365*10)).strftime('%a, %d %b %Y ')}")
    end

    it 'should allow origin to be set' do
      status, headers, body = Rack::AccessControlHeaders.new(@app, /assets/, "http://test.com").call(Rack::MockRequest.env_for("/assets/test.gif"))
      headers["Access-Control-Allow-Origin"].should match("http://test.com")
    end

    it 'should not set access control header' do
      status, headers, body = Rack::AccessControlHeaders.new(@app, /assets/).call(Rack::MockRequest.env_for("/users/1"))
      headers.should_not include("Cache-Control")
      headers.should_not include("Access-Control-Allow-Origin")
      headers.should_not include("Expires")
    end
  end
end
