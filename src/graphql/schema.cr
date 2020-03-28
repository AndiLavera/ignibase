# Available Types include:
# String, Boolean, Int, Float, ID
module Ignibase::Schema
  include ::GraphQL::Schema

  def schema
    schema = GraphQL::Schema.from_schema(
      %{
        schema {
          query: QueryType,
          mutation: MutationType
        }

        type QueryType {
          users: [UserType]
          user(
            email: String!
            preferences: String
            first_name: String
            last_name: String
          ): UserType
        }

        type MutationType {}

        type UserType {
          email: String
          preferences: String
          first_name: String
          last_name: String
        }
      }
    )

    #schema.add_input_type("UserType", UserType)
    schema.query_resolver = QueryType
    schema.mutation_resolver = MutationType
    # test
    schema
  end
end
