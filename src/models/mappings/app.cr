class App < ApplicationRecord
  mapping(
    name: {type: String?},
    uuid: {type: String?},
  )
end
