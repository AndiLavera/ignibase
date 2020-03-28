# https://imdrasil.github.io/jennifer.cr/docs/getting_started if you would like to change the adapter
require "jennifer/adapter/postgres"
require "colorize"

# If you change to pg or mysql, uncomment the line below and comment out the Jennifer::Config block
Jennifer::Config.read("./config/database.yml", Amber.env.to_s)

Jennifer::Config.configure do |conf|
  conf.logger = Logger.new(STDOUT)

  conf.logger.formatter = Logger::Formatter.new do |_, datetime, _, message, io|
    io << datetime.colorize(:cyan) << ": \n" << message.colorize(:light_magenta)
  end
  conf.logger.level = Logger::INFO
end
