class App < ApplicationRecord
  mapping(
    name: {type: String},
    uuid: {type: String?},
    # `user_id` represents the owner or the user record that created the app
    #
    # Used for easy querying
    user_id: {type: Int32}
  )
end
