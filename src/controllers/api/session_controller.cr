require "jwt"

# This controller is used internally on the website thus
# does not require versioning
class API::SessionController < ApplicationController
  def create
    user = User.where { _email == resource_params["email"] }.first

    if user && user.authenticate(resource_params.validate!["password"])
      # `token` is used in `src/json/api/session/create.jbuilder`
      # ameba:disable Lint/UselessAssign
      token = ::JWT.encode({:email => user.email}, Amber.settings.secret_key_base, ::JWT::Algorithm::HS256)
      # ameba:enable Lint/UselessAssign
      Kilt.render("src/json/api/session/create.jbuilder")
    else
      Kilt.render("src/json/api/session/errors/create.jbuilder")
    end
  end

  private def resource_params
    params.validation do
      required :email
      required :password
    end
  end
end
