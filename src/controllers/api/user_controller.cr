# This controller is used internally on the website thus
# does not require versioning
class API::UserController < ApplicationController
  def create
    user = User.new_top_level(resource_params.validate!)

    if user.save
      Kilt.render("src/json/api/user/create.jbuilder")
    else
      Kilt.render("src/json/api/user/errors/create.jbuilder")
    end
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
