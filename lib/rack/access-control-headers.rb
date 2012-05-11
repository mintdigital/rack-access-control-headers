module Rack
  class AccessControlHeaders
    def initialize(app, path)
      @app = app
      @path = path
    end

    def call(env)
      response = @app.call(env)
      if env["PATH_INFO"].match @path
        response[1]["Access-Control-Allow-Origin"] = "*"
        response[1]["Cache-Control"] = "public"
        response[1]["Expires"] = 10.years.from_now.httpdate
      end
      response
    end
  end
end
