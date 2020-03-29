# Defines all methods & queries that can be invoked on the `User`
#
# Examples:
#
# `schema.execute("{ users { email first_name } }")`
#
# ```crystal
# {
#       "data" => {
#                   "users" => [
#                                {
#                                  "email" => "email@gmail.com",
#                                   "first_name" => "my_first_name"
#                                },
#                                {
#                                  "email" => "email2@gmail.com",
#                                   "first_name" => "my_first_name2"
#                                }
#                              ]
#                 }
#     }
# ```
#
# `schema.execute("{ user(email: "email@gmail.com") { email first_name } }")`
#
# ```crystal
# {
#   "data" => {
#               "users" => {
#                            "email" => "email@gmail.com",
#                            "first_name" => "my_first_name"
#                          }
#             }
# }
# ```

module UserQueries
  include GraphQL::ObjectType
  extend self

  field :users do
    User.all.to_a
  end

  field :user do |args|
    if (email = args["email"])
      User.where { _email == email.to_s }.first if email
    end
  end
end
