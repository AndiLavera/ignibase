class AppsUsers < ApplicationRecord
  # TODO: Need a way to differentiate between account & user(owner)
  # Possibly:
  # is_account: bool, default: false, null false, not nilable
  # owner_id: User.id, nilable, checks presence if is_account
  belongs_to :user, User
  belongs_to :app, App, primary: :uuid, foreign: :app_id
end
