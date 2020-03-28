# GraphQL-Crystal only supports 1 `QueryType` in the schema
#
# This file is designed to consolidate all queries under 1 module
# before being injected into the schema
require "./user_queries"

module QueryType
  extend self

  include UserQueries
end
