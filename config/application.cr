# About Application.cr File
#
# This is Amber application main entry point. This file is responsible for loading
# initializers, classes, and all application related code in order to have
# Amber::Server boot up.
#
# > We recommend not modifying the order of the requires since the order will
# affect the behavior of the application.

require "jennifer"

require "amber"
require "./settings"
require "./i18n"
require "./database"
require "./initializers/**"

# Start Generator Dependencies: Don't modify.
require "../src/models/application"
require "../src/models/**"
require "../src/pipes/**"
# End Generator Dependencies

# GraphQL
#
# Must be required before the graphql controller
# but after ApplicationRecord
require "graphql-crystal"
require "../src/graphql/queries/*"
require "../src/graphql/mutations/*"
require "../src/graphql/schema"
require "../src/graphql/*"

require "../src/helpers/*"
require "../src/controllers/application_controller"
require "../src/controllers/**"
require "./routes"

require "amber"

require "../src/controllers/application_controller"
require "../src/controllers/**"
