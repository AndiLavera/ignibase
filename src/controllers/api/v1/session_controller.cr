require "jwt"

class API::V1::SessionController < ApplicationController
  def create
    user = User.where { _email == resource_params["email"] }.first

    if user
      token = JWT.encode(user.email, Amber.settings.secret_key_base, JWT::Algorithm::HS256)
      Kilt.render("src/json/api/v1/session/create.jbuilder")
    else
      Kilt.render("src/json/api/v1/session/errors/create.jbuilder")
    end
  end

  private def resource_params
    params.validation do
      required :email
      required :password
    end
  end
end