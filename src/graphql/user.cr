class User < ApplicationRecord
  include GraphQL::ObjectType
  field :email
  field :preferences
  field :first_name
  field :last_name
end
