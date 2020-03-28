class User < ApplicationRecord
  include GraphQL::ObjectType
  field :email
  field :preferences
  field :full_name
end
