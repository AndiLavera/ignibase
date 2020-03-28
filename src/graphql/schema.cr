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
            full_name: String
          ): UserType
        }

        type MutationType {}

        type UserType {
          email: String
          preferences: String
          full_name: String
        }
      }
    )

    schema.query_resolver = QueryType
    schema.mutation_resolver = MutationType
    schema
  end
end
