class API::JWT::AppController < ApplicationController
  include UserQueryHelper

  def index
    user = find_user_from_jwt(resource_params["token"])

    if user && user.apps
      # Used in jbuilder
      # ameba:disable Lint/UselessAssign
      apps = user.apps
      pp apps
      # ameba:enable Lint/UselessAssign
      Kilt.render("src/json/api/app/index.jbuilder")
    else
    end
  end

  def show
  end

  def create
    user = find_user_from_jwt(resource_params["token"])
    name = resource_params.validate!["name"]
    return unless name
    app = App.new({ name: name })

    if app.save
      if user && app.uuid
        AppsUsers.create({ user_id: user.id, app_id: app.uuid })
      end
    else
    end
  end

  def update
  end

  def resource_params
    params.validation do
      required :token
      optional :name
      #optional :environment
    end
  end
end