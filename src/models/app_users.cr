class AppsUsers < ApplicationRecord
  belongs_to :user, User
  belongs_to :app, App, primary: :uuid, foreign: :app_id
end
