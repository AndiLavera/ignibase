module Validations
  def invalid_api_key
    Kilt.render("src/json/shared/invalid_api_key.jbuilder")
  end

  def invalid_credentials
    Kilt.render("src/json/shared/invalid_account_credentials.jbuilder")
  end
end
