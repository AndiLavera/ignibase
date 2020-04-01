class HTTP::Server::Context
  property current_user : User?
end

class AuthenticateAPIKey < Amber::Pipe::Base
  def call(context)
    token = context.request.headers["X-Auth-Token"]
    key = APIKey.where { _key == token }.first if token
    app = key.app if key
    user = app.owner if app

    if user
      context.current_user = user
      call_next(context)
    else
      # context.flash[:warning] = "Please Sign In"
      # context.response.headers.add "Location", "/signin"
      context.response.status_code = 400
    end
  end
end
