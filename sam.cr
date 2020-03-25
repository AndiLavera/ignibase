# src/sam.cr
require "jennifer"
require "amber"
require "./config/database"

require "./db/migrations/*"
require "sam"
require "jennifer/sam"
load_dependencies "jennifer"
Sam.help
