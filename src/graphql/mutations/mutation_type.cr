# GraphQL-Crystal only supports 1 `MutationType` in the schema
#
# This file is designed to consolidate all mutations under 1 module
# before being injected into the schema
module MutationType
  include GraphQL::ObjectType
  extend self
end
