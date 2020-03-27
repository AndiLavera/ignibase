class HTTP::Server::Context
  property current_user : User?
end

class AuthenticateAPIKey < Amber::Pipe::Base
  def call(context)
    if context.params["api_key"]?
      user = User.where { _api_key == context.params["api_key"] }.first unless context.params["api_key"]?.nil?
    end

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