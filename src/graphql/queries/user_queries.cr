module UserQueries
  include GraphQL::ObjectType
  extend self

  field :users do
    User.all.to_a
  end

  field :user do |args|
    if (email = args["email"])
      User.where { _email == email.to_s }.first if email
    end
  end
end
