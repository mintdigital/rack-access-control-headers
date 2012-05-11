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
        response[1]["Expires"] = 10.years.from_now.httpdate
      end
      response
    end
  end
end
