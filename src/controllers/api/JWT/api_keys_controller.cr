# This controller is used internally on the website thus
# does not require versioning

# You may notice there is no update method.
# This is due to the fact that we do not allow updating keys
# Updating is best done by deleting the current key
# and creating a new one. This is for security purposes.
class API::JWT::APIKeysController < ApplicationController

  # Fetches all api keys owned by a particular application
  # post "/api/api_key", API::JWT::APIKeysController, :index
  def index
    app = App.where { _uuid == resource_params.validate!["app_id"] }.first

    if app && app.valid_user?(current_user)
      # Used in the jbuilder
      # ameba:disable Lint/UselessAssign
      keys = app.keys
      # ameba:enable Lint/UselessAssign
      Kilt.render("src/json/api/keys/index.jbuilder")
    else
      Kilt.render("src/json/api/keys/errors/index.jbuilder")
    end
  end

  # Creates new api keys
  # post "/api/api_key/create", API::JWT::APIKeysController, :create
  def create
    environment = resource_params.validate!["environment"]
    app = App.where { _uuid == resource_params.validate!["app_id"] }.first

    if environment && app && app.valid_user?(current_user)
      # Used in the jbuilder
      # ameba:disable Lint/UselessAssign
      key = APIKey.create({ app_id: app.id, environment: environment })
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
      required :app_id
      optional :email
      optional :environment
    end
  end
end
