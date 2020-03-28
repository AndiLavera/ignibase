class GraphQLController < ApplicationController
  include QueryType
  include MutationType
  include Ignibase::Schema

  def index
    schema.execute(user_params["query"])
  end

  private def user_params
    params.validation do
      required :query
    end
  end
end
