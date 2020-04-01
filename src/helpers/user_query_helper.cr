require "jwt"

module UserQueryHelper
  def find_user_from_jwt(params : String)
    # ameba:disable Lint/UselessAssign
    payload, _header = ::JWT.decode(params, Amber.settings.secret_key_base, ::JWT::Algorithm::HS256)
    # ameba:enable Lint/UselessAssign
    User.where { _email == payload["email"] }.first unless payload["email"]?.nil?
  end
end
