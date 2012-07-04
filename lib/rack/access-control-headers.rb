module Rack
  class AccessControlHeaders
    def initialize(app, path, origin = "*")
      @app = app
      @path = path
      @origin = origin
    end

    def call(env)
      response = @app.call(env)
      if env["PATH_INFO"].match @path
        response[1]["Access-Control-Allow-Origin"] = @origin
        response[1]["Cache-Control"] = "public"
        response[1]["Expires"] = (Time.now + (60*60*24*365*10)).httpdate
      end
      response
    end
  end
end
