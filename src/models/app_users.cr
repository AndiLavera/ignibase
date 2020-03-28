class AppsUsers < ApplicationRecord
  belongs_to :user, User
  belongs_to :app, App
end
