class AppsUsers < ApplicationRecord
  mapping(
    app_id: { type: String? },
    user_id: { type: Int32? }
  )
end
