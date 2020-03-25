class SessionController < Mochi::Controllers::Authenticable::SessionController
  def new
    super
  end

  def create
    user = User.where { _email == params["email"].to_s }.first
    super(user)
  end

  def delete
    super
  end

  private def user_params
    params.validation do
      required :email
      required :password
    end
  end
end
