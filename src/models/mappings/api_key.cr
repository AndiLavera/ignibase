class APIKey < ApplicationRecord
  mapping(
    app_id: { type: Int32? },
    key: { type: String? },
    environment: { type: String? },
  )
end
