class UsersController < ApplicationController
  def create

    user = build_user(resource_params.validate!)
    pp user

    if user.save
      Kilt.render("src/json/user/create.jbuilder")
    else
      Kilt.render("src/json/user/errors/create.jbuilder")
    end
  end

  private def build_user(params)
    user = User.new
    user.email = params["email"] if params["email"]
    if (password = params["password"])
      user.password = password
    end
    # user.first_name = params["firstName"]
    # user.last_name = params["lastName"]
    # user.terms_of_service = params["termsOfService"]
    user
  end

  private def resource_params
    params.validation do
      required :email
      required :password
      optional :firstName
      optional :lastName
      optional :termsOfService
    end
  end
end