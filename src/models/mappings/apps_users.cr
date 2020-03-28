class AppsUsers < ApplicationRecord
  mapping(
    app_id: { type: Int32? },
    user_id: { type: Int32? }
  )
end