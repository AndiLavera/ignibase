require "jwt"

class HTTP::Server::Context
  property current_user : User?
end

class AuthenticateJWT < Amber::Pipe::Base
  def call(context)
    if context.params["token"]?
      payload, _header = JWT.decode(context.params["token"], Amber.settings.secret_key_base, JWT::Algorithm::HS256)
      user = User.where { _email == payload["email"] }.first unless payload["email"]?.nil?
    end

    if user
      context.current_user = user
      call_next(context)
    else
      context.flash[:warning] = "Please Sign In"
      context.response.headers.add "Location", "/signin"
      context.response.status_code = 302
    end
  end
end