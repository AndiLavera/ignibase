ENV["AMBER_ENV"] ||= "test"

require "spec"

# require the entire application
require "../config/*"
# require all our factories
require "factory"
require "factory/jennifer"
require "./factories/**"

# Rollback all changes in the DB after test case is by using a transaction
Spec.before_each do
  Jennifer::Adapter.adapter.begin_transaction
end
Spec.after_each do
  Jennifer::Adapter.adapter.rollback_transaction
end
