class UserFactory < Factory::Jennifer::Base
  # association :author, strategy: :build
  # association :actor, UserFactory, strategy: :create, options: {name: "Artemius Fault"}

  # initialize_with do |hash, traits|
  #   obj = Test.new(hash)
  #   make_assigns(obj, traits) # makes all assignements (traits will be described later)
  #   obj
  # end

  # after_initialize do |t|
  #   super # if you want parrent one to be inked as well
  #   t.f1.not_nil! += 1
  # end

  argument_type String
  attr :email, "test@gmail.com"
  attr :password, "Password123"
  attr :password_digest, "$2a$10$fJtC9AeAQdd0tP.F65pk3uFh.YrEu0o7bhBes/vNIwZ5DFgPBfJua"
  attr :first_name, "igni"
  attr :last_name, "base"
end