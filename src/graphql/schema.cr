# Available Types include:
# String, Boolean, Int, Float, ID
module Ignibase::Schema
  include QueryType
  include MutationType
  include ::GraphQL::Schema

  SCHEMA = GraphQL::Schema.from_schema(
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
  SCHEMA.query_resolver = QueryType
  SCHEMA.mutation_resolver = MutationType
end
