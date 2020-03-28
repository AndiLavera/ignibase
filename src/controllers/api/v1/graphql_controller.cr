class GraphQLController < ApplicationController
  include QueryType
  include MutationType
  include Ignibase::Schema

  def index
    schema.execute(graphql_params["query"])
  end

  private def graphql_params
    params.validation do
      required :query
    end
  end
end
