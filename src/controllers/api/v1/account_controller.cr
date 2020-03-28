require "kilt/jbuilder"
require "jbuilder"

class AccountController < ApplicationController
  include Validations

  # GET /account
  # Get currently logged in user data
  def index
    account = User.where { _email == resource_params["email"] }.first
    return invalid_credentials unless account
    return invalid_credentials unless account.authenticate(resource_params["password"])

    Kilt.render("src/json/account/index.jbuilder")
  end

  # POST /account
  # Allow a new user to register a new account
  def create
    account = User.new
    if account.create_user_and_app_user!(resource_params)
      Kilt.render("src/json/account/create.jbuilder")
    else
      Kilt.render("src/json/account/errors/create.jbuilder")
    end
  end

  # PATCH /account
  # Update currently logged in user account name.
  def update
    account = Account.where { _email == resource_params["email"] }.first
    return invalid_email unless account
    return invalid_password unless account.authenticate(resource_params["password"])

    if account.update_information!(resource_params)
      Kilt.render("src/json/account/update.jbuilder")
    else
      Kilt.render("src/json/account/errors/update.jbuilder")
    end
  end

  # ========================================
  # PATCH /account/password
  # Update currently logged in user password.

  # PATCH /account/email
  # Update currently logged in user account email address.

  # DELETE /account
  # Delete a currently logged in user account.
  # ========================================

  # ========================================
  # GET /account/sessions
  # Get currently logged in user list of active sessions across different devices.

  # POST /account/sessions
  # Allow the user to login into his account

  # DELETE /account/sessions/{sessionId}
  # Log out the currently logged in user from all his account sessions

  # DELETE /account/sessions
  # Delete all sessions from the user account and remove any sessions cookies from the end client.

  # GET /account/sessions/oauth2/{provider}
  # ========================================

  # ========================================
  # GET /account/logs
  # Get currently logged in user list of latest security activity logs. Each log returns user IP address, location and date and time of log.
  # ========================================

  # ========================================
  # GET /account/prefs
  # Get currently logged in user preferences as a key-value object.

  # PATCH /account/prefs
  # Update currently logged in user account preferences.
  # ========================================

  # ========================================
  # POST /account/recovery
  # Sends the user an email with a temporary secret key for password reset.

  # PATCH /account/recovery
  # Complete the user account password reset.
  # ========================================

  # ========================================
  # POST /account/verification
  # Send a verification message to your user email address to confirm they are the valid owners of that address.

  # PATCH /account/verification
  # Complete the user email verification process.
  # ========================================

  def resource_params
    params.validation do
      required(:app_id)
      required(:email)
      required(:password)
      optional(:full_name)
      optional(:password_confirmation)
    end
  end
end
