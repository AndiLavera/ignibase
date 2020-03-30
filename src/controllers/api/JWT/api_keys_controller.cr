# This controller is used internally on the website thus
# does not require versioning

# You may notice there is no update method.
# This is due to the fact that we do not allow updating keys
# Updating is best done by deleting the current key
# and creating a new one. This is for security purposes.
class API::JWT::APIKeysController < ApplicationController
  # Fetches all api keys owned by a particular application
  def index
    user = User.where { _email == resource_params.validate!["email"] }.first

    if user
      apps_users = AppsUsers
              .where {
                _app_id == resource_params.validate!["app_id"] &&
                _user_id == user.id
              }
              .first

      app = apps_users.app if apps_users
      # Used in the jbuilder
      # ameba:disable Lint/UselessAssign
      (apps_users ? (keys = app.keys) : nil) if app
      # ameba:enable Lint/UselessAssign
      Kilt.render("src/json/api/keys/show.jbuilder")
    else
      Kilt.render("src/json/api/keys/errors/show.jbuilder")
    end
  end

  # Creates new api keys
  def create
    user = User.where { _email == resource_params.validate!["email"] }.first
    environment = resource_params.validate!["environment"]

    if user && environment
      apps_users = AppsUsers
                    .where {
                      _app_id == resource_params.validate!["app_id"] &&
                      _user_id == user.id
                    }
                    .first

      apps_users ? (app = apps_users.app) : nil
      # Used in the jbuilder
      # ameba:disable Lint/UselessAssign
      key = APIKey.create({app_id: app.id, environment: environment}) if app
      # ameba:enable Lint/UselessAssign
      Kilt.render("src/json/api/keys/create.jbuilder")
    else
      Kilt.render("src/json/api/keys/errors/create.jbuilder")
    end
  end

  # If we ever design permissions for keys, you should
  # be able to update those permissions at any time.
  # def update; end

  def resource_params
    params.validation do
      required :email
      required :app_id
      optional :environment
    end
  end
end
