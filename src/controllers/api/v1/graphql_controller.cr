class GraphQLController < ApplicationController
  include Ignibase::Schema

  def index
    SCHEMA.execute(graphql_params["query"])
  end

  private def graphql_params
    params.validation do
      required :query
    end
  end
end
