class API::JWT::AppController < ApplicationController
  include UserQueryHelper

  def index
    user = find_user_from_jwt(resource_params["token"])

    if user && user.apps
      # Used in jbuilder
      # ameba:disable Lint/UselessAssign
      apps = user.apps
      # ameba:enable Lint/UselessAssign
      Kilt.render("src/json/api/app/index.jbuilder")
    else
    end
  end

  def show
  end

  def create
    user = current_user
    if user
      app = App.new({name: resource_params["name"], user_id: user.id})
      if app.save
        if user && app.uuid
          AppsUsers.create({user_id: user.id, app_id: app.uuid})
        end
      else
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
      # optional :environment
    end
  end
end
