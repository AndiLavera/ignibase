require "uuid"

class App < ApplicationRecord
  has_and_belongs_to_many :users, User

  validates_presence :name
  validates_uniqueness :uuid

  before_validation :generate_uuid

  private def generate_uuid
    self.uuid = UUID.random.to_s
  end
end
