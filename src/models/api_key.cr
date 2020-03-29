require "uuid"

class APIKey < ApplicationRecord
  belongs_to :app, App

  validates_presence :key
  validates_presence :environment
  validates_uniqueness :key

  before_validation :generate_uuid

  private def generate_uuid
    self.uuid = UUID.new(UUID.random).hexstring
  end
end
