class AppsUsers < ApplicationRecord
  mapping(
    app_id: { type: Int32? },
    user_id: { type: Int32? }
  )

  belongs_to :user, User
  belongs_to :app, App
end
